obs = obslua

--------------------------------------------------
-- CONFIGURACIÓN
--------------------------------------------------

timer_source_name = ""

focus_min = 25
short_min = 5
long_min = 15

sessions_before_long = 4
sessions_total = 8

--------------------------------------------------
-- ESTADO
--------------------------------------------------

session_current = 1
time_left = 0
mode = "FOCUS"
running = false

--------------------------------------------------
-- SONIDOS
--------------------------------------------------

snd_focus = ""
snd_short = ""
snd_long = ""
snd_minute = ""
snd_tick = ""

enable_focus = true
enable_short = true
enable_long = true
enable_minute = true
enable_tick = true

--------------------------------------------------
-- REPRODUCIR SONIDO
--------------------------------------------------

function play_sound(name)

    if name == "" then return end

    local source = obs.obs_get_source_by_name(name)

    if source ~= nil then
        obs.obs_source_media_restart(source)
        obs.obs_source_release(source)
    end

end

--------------------------------------------------
-- ACTUALIZAR TEXTO
--------------------------------------------------

function update_timer_text()

    local source = obs.obs_get_source_by_name(timer_source_name)

    if source ~= nil then

        local minutes = math.floor(time_left / 60)
        local seconds = time_left % 60

        local text = string.format(
        "%s [%02d:%02d]\nSesión %d/%d",
        mode,
        minutes,
        seconds,
        session_current
        ,sessions_total
        )

        local settings = obs.obs_data_create()

        obs.obs_data_set_string(settings,"text",text)

        obs.obs_source_update(source,settings)

        obs.obs_data_release(settings)
        obs.obs_source_release(source)

    end

end

--------------------------------------------------
-- CAMBIAR FASE
--------------------------------------------------

function next_phase()

    if mode == "FOCUS" then

        if session_current % sessions_before_long == 0 then

            mode = "LONG BREAK"
            time_left = long_min * 60

            if enable_long then
                play_sound(snd_long)
            end

        else

            mode = "SHORT BREAK"
            time_left = short_min * 60

            if enable_short then
                play_sound(snd_short)
            end

        end

    else

        session_current = session_current + 1
        if session_current > sessions_total then
            session_current = 1
        end

       mode = "FOCUS"
        time_left = focus_min * 60

        if enable_focus then
            play_sound(snd_focus)
        end

    end

end

--------------------------------------------------
-- TIMER
--------------------------------------------------

function timer_callback()

    if not running then return end

    time_left = time_left - 1

    ---------------------------------
    -- AVISO 10 MINUTOS
    ---------------------------------

    if mode == "FOCUS"
    and time_left > 0
    and time_left <= 600
    and time_left % 60 == 0
    and enable_minute then

        play_sound(snd_minute)

    end

    ---------------------------------
    -- AVISO 10 SEGUNDOS
    ---------------------------------

    if time_left > 0
    and time_left <= 10
    and enable_tick then

        play_sound(snd_tick)

    end

    ---------------------------------

    if time_left <= 0 then
        next_phase()
    end

    update_timer_text()

end

--------------------------------------------------
-- CONTROLES
--------------------------------------------------

function start_timer()

    if not running then
        running = true

        -- reproducir sonido al iniciar la primera sesión
        if mode == "FOCUS" and session_current == 1 then
            if enable_focus then
                play_sound(snd_focus)
            end
        end
    end

end

function pause_timer()
    running = false
end

function reset_timer()

    running = false

    session_current = 1
    mode = "FOCUS"

    time_left = focus_min * 60

    update_timer_text()

end

function skip_phase()

    next_phase()

    update_timer_text()

end

--------------------------------------------------
-- DESCRIPCIÓN DEL SCRIPT
--------------------------------------------------

function script_description()

return [[
Pomodoro Timer para OBS

INSTRUCCIONES:

1. Crea una fuente de texto en tu escena.
2. Selecciónala en este script.
3. El script actualizará automáticamente el texto.

CONFIGURACIÓN:

Focus → tiempo de trabajo
Short Break → descanso corto
Long Break → descanso largo

Puedes definir:

• duración de sesiones
• duración de descansos
• cada cuántas sesiones ocurre descanso largo
• sonidos opcionales

CONTROLES:

Start → inicia el temporizador
Pause → pausa
Reset → reinicia desde sesión 1
Skip → salta al siguiente periodo
]]

end

--------------------------------------------------
-- UI
--------------------------------------------------

function script_properties()

    local p = obs.obs_properties_create()

    obs.obs_properties_add_text(
    p,
    "timer_source",
    "Fuente de texto del temporizador",
    obs.OBS_TEXT_DEFAULT)

    obs.obs_properties_add_int(p,"focus","Minutos Focus",1,180,1)
    obs.obs_properties_add_int(p,"short","Minutos descanso corto",1,60,1)
    obs.obs_properties_add_int(p,"long","Minutos descanso largo",1,60,1)

    obs.obs_properties_add_int(
    p,
    "long_after",
    "Cada cuántas sesiones hay descanso largo",
    2,10,1)
    obs.obs_properties_add_int(p,"sessions_total","Total de sesiones del ciclo",1,50,1)

    ------------------------------------------------
    -- SONIDOS
    ------------------------------------------------

    obs.obs_properties_add_bool(p,"enable_focus","Sonido inicio Focus")
    obs.obs_properties_add_text(p,"snd_focus","Fuente sonido Focus",obs.OBS_TEXT_DEFAULT)

    obs.obs_properties_add_bool(p,"enable_short","Sonido descanso corto")
    obs.obs_properties_add_text(p,"snd_short","Fuente sonido Short",obs.OBS_TEXT_DEFAULT)

    obs.obs_properties_add_bool(p,"enable_long","Sonido descanso largo")
    obs.obs_properties_add_text(p,"snd_long","Fuente sonido Long",obs.OBS_TEXT_DEFAULT)

    obs.obs_properties_add_bool(p,"enable_minute","Aviso últimos 10 minutos")
    obs.obs_properties_add_text(p,"snd_minute","Fuente sonido aviso minuto",obs.OBS_TEXT_DEFAULT)

    obs.obs_properties_add_bool(p,"enable_tick","Aviso últimos 10 segundos")
    obs.obs_properties_add_text(p,"snd_tick","Fuente sonido tick",obs.OBS_TEXT_DEFAULT)

    ------------------------------------------------
    -- BOTONES
    ------------------------------------------------

    obs.obs_properties_add_button(p,"start","Start",start_timer)
    obs.obs_properties_add_button(p,"pause","Pause",pause_timer)
    obs.obs_properties_add_button(p,"reset","Reset",reset_timer)
    obs.obs_properties_add_button(p,"skip","Skip fase",skip_phase)

    return p

end

--------------------------------------------------
-- ACTUALIZAR CONFIG
--------------------------------------------------

function script_update(settings)

    timer_source_name =
    obs.obs_data_get_string(settings,"timer_source")
    sessions_total =
    obs.obs_data_get_int(settings,"sessions_total")

    focus_min = obs.obs_data_get_int(settings,"focus")
    short_min = obs.obs_data_get_int(settings,"short")
    long_min = obs.obs_data_get_int(settings,"long")

    sessions_before_long =
    obs.obs_data_get_int(settings,"long_after")

    snd_focus = obs.obs_data_get_string(settings,"snd_focus")
    snd_short = obs.obs_data_get_string(settings,"snd_short")
    snd_long = obs.obs_data_get_string(settings,"snd_long")
    snd_minute = obs.obs_data_get_string(settings,"snd_minute")
    snd_tick = obs.obs_data_get_string(settings,"snd_tick")

    enable_focus = obs.obs_data_get_bool(settings,"enable_focus")
    enable_short = obs.obs_data_get_bool(settings,"enable_short")
    enable_long = obs.obs_data_get_bool(settings,"enable_long")
    enable_minute = obs.obs_data_get_bool(settings,"enable_minute")
    enable_tick = obs.obs_data_get_bool(settings,"enable_tick")

end

--------------------------------------------------
-- INICIO
--------------------------------------------------

function script_load(settings)

    time_left = focus_min * 60

    obs.timer_add(timer_callback,1000)

end