fix_box = physics_fixture_create();
physics_fixture_set_kinematic(fix_box);
physics_fixture_set_density(fix_box, 1);
physics_fixture_set_restitution(fix_box, 0);
physics_fixture_set_collision_group(fix_box, 0);
physics_fixture_set_linear_damping(fix_box, 1);
physics_fixture_set_angular_damping(fix_box, 1);
physics_fixture_set_friction(fix_box, 1);
physics_fixture_set_box_shape(fix_box, (sprite_width * abs(image_xscale)) /2,((sprite_height * abs(image_yscale)) /2));
physics_fixture_bind(fix_box, id);
physics_fixture_delete(fix_box);

/*
fix_box = physics_fixture_create();
physics_fixture_set_kinematic(fix_box);
physics_fixture_set_density(fix_box, 0.5);
physics_fixture_set_restitution(fix_box, 0);
physics_fixture_set_collision_group(fix_box, -1);
physics_fixture_set_linear_damping(fix_box, 1);
physics_fixture_set_angular_damping(fix_box, 1);
physics_fixture_set_friction(fix_box, 0);
physics_fixture_set_box_shape(fix_box, (sprite_width * abs(image_xscale)) /2,((sprite_height * abs(image_yscale)) /2) - ((sprite_height * abs(image_yscale)) /10));
physics_fixture_bind_ext(fix_box, id, 0, ((sprite_height * abs(image_yscale)) /10));
physics_fixture_delete(fix_box);

if(rollerball == noone) rollerball = instance_create(rollerball_pos_x, rollerball_pos_x, obj_rollerball)
with(rollerball)
{
    fix_ball = physics_fixture_create();
    physics_fixture_set_kinematic(fix_ball);
    physics_fixture_set_density(fix_ball, 0.5);
    physics_fixture_set_restitution(fix_ball, 0);
    physics_fixture_set_collision_group(fix_ball, -1);
    physics_fixture_set_linear_damping(fix_ball, 1);
    physics_fixture_set_angular_damping(fix_ball, 1);
    physics_fixture_set_friction(fix_ball, 1);
    physics_fixture_set_circle_shape(fix_ball, obj_player.rollerball_radius);
    physics_fixture_bind(fix_ball, id);
    phy_fixed_rotation = true;
}

motorJoint = physics_joint_revolute_create(id,rollerball,x,y + ((sprite_height * abs(image_yscale)) /2) - ((sprite_height * abs(image_yscale)) /6) - 5, 0, 0, false, 0, 0, false, false );
*/
phy_fixed_rotation = true;
