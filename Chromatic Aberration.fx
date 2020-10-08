float ColorOffests : register(C0);


sampler2D  input : register(S0);

float4 main(float2  uv : TEXCOORD) : COLOR 
{ 
	float multiplier = (abs(uv.x-0.5) + abs(uv.y-0.5 ))/2; //=(|x-0.5| + |y-0.5|)/2
	float blueColor = tex2D(input, multiplier *( (uv * (1 - ColorOffests)) + ColorOffests) + (1-multiplier)*uv).b;
	float greenColor = tex2D(input,multiplier *((uv * (1 - ColorOffests - ColorOffests)) + ColorOffests)+ (1-multiplier)*uv).g;
	float redColor = tex2D(input,multiplier *((uv * (1 - ColorOffests - ColorOffests - ColorOffests)) +ColorOffests)+ (1-multiplier)*uv).r;
	float4 nextColor = {redColor,greenColor,blueColor,1};
	
	return nextColor;
	//lerp(color,nextColor, 1-multiplier );
	//color *(1- multiplier) + multiplier * nextColor;
}

