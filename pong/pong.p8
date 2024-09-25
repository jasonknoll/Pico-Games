pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--pong remake
--jason knoll

--[[
todo
- add redundancies to functions
- cleaup if-statements
--]]

ball_x=64
ball_x_dir=-2
ball_y=64
ball_y_dir=0 -- start off straight

--players can only move up and down
p1_y=60
p1_x=5
p2_y=60
p2_x=123 -- 128 - 5

p1_score=0
p2_score=0

function draw_ball(x, y)
	circfill(x, y, nil, 7)
end


--[[
similar to arduino, i believe.

init - runs on startup
update - meant for data updates***
draw - meant to update the 
screen data*** called once
per frame
* - back then, you needed
both update and draw. now
we only need to use one of them
--]]

function _init()
end

--[[
buttons
0 - left ⬅️
1 - right ➡️
2 - up ⬆️ 
3 - down ⬇️
🅾️ - z
❎ - x
--]]

function _update()
-- plyaer controls
	if (btn(2, 0)) p1_y -= 1
	if (btn(3, 0)) p1_y += 1
	
	if (btn(2, 1)) p2_y -= 1
	if (btn(3, 1)) p2_y += 1

-- just have ball bouncing for now
	if (ball_y == 0 or ball_y == 128) then 
	
		ball_y_dir = -ball_y_dir
		-- todo
		-- make the ball go faster
		-- make ball switch direction occasionally
		
	end
	
	if (ball_x == 0 or ball_x == 128) then 
	
		ball_x_dir = -ball_x_dir
		
	end
	
-- check player collision
	if (abs(ball_x-p1_x) <= 2 and ball_y >= p1_y and ball_y <= p1_y+8) then
	 -- make the ball pick a direction
		if (ball_y_dir == 0) then 
			ball_y_dir = rnd({1, 2})
			if (ball_y_dir == 1) ball_y_dir -= 3
		end
 	
		ball_x_dir = -ball_x_dir
	end
	
	if (abs(ball_x-p2_x) <= 2 and ball_y >= p2_y and ball_y <= p2_y+8) then
	 -- make the ball pick a direction
		if (ball_y_dir == 0) then 
			ball_y_dir = rnd({1, 2})
			if (ball_y_dir == 1) ball_y_dir -= 3
		elseif (abs(ball_y_dir) == 2) then
			 
		end
 	
		ball_x_dir = -ball_x_dir
	end
	
-- score
	if (ball_x == 0) then
	
		ball_x=64
		ball_y=64
		ball_y_dir=0
		ball_x_dir=-2
		p1_y=60
		p2_y=60
	 p2_score += 1
	
	end
	 
	if (ball_x == 128) then
	
		ball_x=64
		ball_y=64
		ball_y_dir=0
		ball_x_dir=2
		p1_y=60
		p2_y=60
	 p1_score += 1
	
	end 
	

-- move the ball	
	ball_y += ball_y_dir
	ball_x += ball_x_dir 	

end

function _draw()

	cls()
	draw_ball(ball_x, ball_y)
	
	-- draw player
	spr(1, 5, p1_y)
	spr(1, 123, p2_y)
	
	print(p1_score, 42,0)
	print(p2_score, 84,0)
	
end

__gfx__
00000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00060000170501805019050190501905019050190501905018050180501805018050170501705016050160501605015050150501505014050120502005024050240502605028050310502f050290502b05033050
