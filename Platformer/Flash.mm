/*
 * The MIT License (MIT)
 * 
 * Copyright (c) 2014 Pointy Nose Games
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "Flash.h"
#import "LevelController.h"
#import "Game.h"


Flash::Flash(LevelController* level, CGPoint pos, bool left) :
	OneTimeAnim("Flash", level)
{
	// --
	
	int frames[] = { 0, 1, 2 };
	int numFrames = sizeof(frames) / sizeof(int);
	addAction("Default", frames, numFrames, "Flash", 0.075, false);
	
	// --
	
	CCSpriteFrame* initialFrame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Flash0"];
	mNode = [[CCSprite alloc] initWithSpriteFrame:initialFrame];
	mNode.position = pos;
	if (left) mNode.scaleX = -1;
	if (Game::Instance()->DebugOn()) ((CCSprite*)mNode).opacity = 128;
}

Flash::~Flash()
{
	CCLOG(@"DEALLOC: Flash");
}

void Flash::UpdateDraw()
{
	mNode.position = mLevel->PlayerObj()->Node().position;
}

void Flash::UpdateDraw(float t)
{
	mNode.position = mLevel->PlayerObj()->Node().position;
}