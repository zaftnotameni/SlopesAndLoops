class_name PlayerCharacterStatsResource extends Resource

enum STATE { Initial = 0, Grounded, Airborne, Off }

var player : CharacterBody2D

@export var state := STATE.Initial :
  set(v):
    if state == v: return
    state_prev = state; state = v
    print("state: %s => %s" % [STATE.find_key(state_prev), STATE.find_key(state)])

@export var state_prev := STATE.Initial
@export var g_accel := 8.0 * Vector2(0.0, 128.0)
@export var jump_initial_vel := 8.0 * Vector2(0.0, 128.0)
@export var max_vel_air := 8.0 * Vector2(128.0, 256.0)
@export var max_vel_ground := 8.0 * Vector2(128.0, 0.0)
@export var input_accel_ground := 4.0 * Vector2(128.0, 0.0)
@export var input_accel_air := 2.0 * Vector2(128.0, 0.0)
@export var frict_ground := Vector2(5.0, 0.0)
@export var frict_air := Vector2(5.0, 0.0)

func _to_string() -> String:
  return var_to_str({
    "floor_normal": player.get_floor_normal(),
    "max_vel_ground":max_vel_ground,
    "max_vel_air":max_vel_air,
    "input_accel_ground":input_accel_ground,
    "input_accel_air":input_accel_air,
    "frict_ground":frict_ground,
    "frict_air":frict_air,
    "g_accel":g_accel,
    "state": "%s => %s" % [STATE.find_key(state_prev), STATE.find_key(state)]
  })
