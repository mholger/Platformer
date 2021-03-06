#import "StdInclude.h"

struct WaterVertex
{
	GLfloat x, y;
	ccColor4F color;
};

struct FoamVertex
{
	GLfloat x, y;
	ccTex2F texCoord;
};

@interface Waves1DNode : CCNode
{
	CGRect _bounds;
	
	ccColor4F _color;
	float _diffusion;
	float _damping;
	
	int _count;
	// Heightfields that the simulation vertlet integrates between.
	float* _h1;
	float* _h2;
	
	CCGLProgram* mWaterShader;
	CCGLProgram* mFoamShader;
	
	CCTexture2D* mFoamTexture;
	
	std::vector<WaterVertex> mWaterVertices;
	std::vector<FoamVertex> mFoamVertices;
}

@property (nonatomic) ccColor4F color;

// 'bounds' are the rectangle to draw for the water. The top of the bounds is the rest height for the water, it wil wave above and below it.
// 'count' is the number of slices to simulate. One per 10-20 pixels is usually sufficient.
// 'damping' is how fast the water settles back to rest. 1.0 is never (bad), 0.0 is immediately (also bad). 0.99 is a decent damping amount.
// 'diffusion' is how fast the waves spread to neighbors. Values outside of 0.6 - 0.9 can become unstable.
-(id) initWithBounds:(CGRect)bounds count:(int)count damping:(float)damping diffusion:(float)diffusion;

-(void) makeSplashAt:(float)x amount:(float)amount;

@end
