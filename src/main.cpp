#include "bn_core.h"
#include "bn_regular_bg_ptr.h"
#include "bn_sprite_ptr.h"
#include "bn_keypad.h"
#include "bn_math.h"
#include "bn_sprite_text_generator.h"
#include "bn_vector.h"
#include "common_info.h"
#include "common_variable_8x8_sprite_font.h"
#include "bn_string.h"
#include "bn_random.h"

#include "bn_sprite_items_paddle.h"
#include "bn_sprite_items_ball.h"
#include "bn_regular_bg_items_background.h"

int main()
{
    bn::core::init();

    //load background
    bn::regular_bg_ptr background = bn::regular_bg_items::background.create_bg(0, 0);

    //load paddle and ball sprites
    bn::sprite_ptr paddle = bn::sprite_items::paddle.create_sprite(0,79);
    bn::sprite_ptr ball = bn::sprite_items::ball.create_sprite(0, 0);

    int score = 0;

    //variables to track the movement of the ball
    int delta_x = 0;
    int delta_y = 0;

    //random object to get random numbers for velociy of ball
    bn::random random;
    
    //object to generate text
    bn::sprite_text_generator text_generator(common::variable_8x8_sprite_font);

    //vector to store sprite characters
    bn::vector<bn::sprite_ptr, 32> text_sprites;
    //printing default text
    text_generator.generate(-60, -68, "(Press any key to start)", text_sprites);

    while(true)
    {
        if (bn::keypad::left_held() && paddle.x() > -112)
        {
            paddle.set_x(paddle.x() - 1);
        }

        else if (bn::keypad::right_held() && paddle.x() < 112)
        {
            paddle.set_x(paddle.x() + 1);
        }
        if (bn::keypad::any_pressed() && delta_x == 0 && delta_y == 0)
        {

            //clear our vector that previously held "(Press any key to start)"
            text_sprites.clear();

            //string to represent score
            bn::string<32> txt_score = "Score: " + bn::to_string<32>(score);
            text_generator.generate(-6 * 16, -68, txt_score, text_sprites);

            //start movement of ball
            while (delta_x == 0 || delta_y == 0)
            {
                //range will be between -2 and 2, excluding 0, so speed and direction is different each time
                delta_x = random.get_int(-2,2);
                delta_y = random.get_int(-2,2);
            }
                
        }
        ball.set_x(ball.x() + delta_x);
        ball.set_y(ball.y() + delta_y);

         //check for collision with bottom part of screen
       if (ball.y() + 2 >= 72)
        {
            //check if the ball is within the horizontal range of the paddle i.e. hits the paddle
            if (ball.x() + 4 >= paddle.x() - 8 && ball.x() - 4 <= paddle.x() + 8)
            {
                //adjust the ball's position to just above the paddle to prevent sticking
                ball.set_y(72 - 2);

                //reverse the directions
                delta_y *= -1;
                score++;
                bn::string<32> txt_score = "Score: " + bn::to_string<32>(score);
                text_generator.generate(-6 * 16, -68, txt_score, text_sprites);

            
            }
            else
            {
                //ball missed

                //reset ball's position, speed, and score
                ball.set_position(0, 0);
                delta_x = 0;
                delta_y = 0;
                score = 0;
                bn::string<32> txt_score = "Score: " + bn::to_string<32>(score) + " (Press any key)";
                text_generator.generate(-6 * 16, -68, txt_score, text_sprites);

            }
        }
        //check for collision with top
        if (ball.y() - 4 <= -80)
        {
            ball.set_y(-80 + 4);
            delta_y *= -1;
        }

        //check for collision with left
        if (ball.x() - 4 <= -120)
        {
            ball.set_x(-120 + 4);
            delta_x *= -1;
        }

        //check for collision with right
        if (ball.x() + 4 >= 120)
        {
            ball.set_x(120 - 4);
            delta_x *= -1;
        }

        bn::core::update();

    }
}
