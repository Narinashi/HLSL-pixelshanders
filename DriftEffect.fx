/// <minValue>0.05 </minValue>
float Thickness : register(C0);
/// <minValue>-2 </minValue>
float Offset : register(C1);
/// <minValue>-0.7 </minValue>
///  <maxValue>3 </maxValue>
float Slope : register(C2);
/// <minValue>0.01</minValue>
/// <maxValue>0.3</maxValue>
float ZoomFactor : register(C3); 
sampler2D  input : register(S0);

float4 main(float2  uv : TEXCOORD) : COLOR 
{ 
	float4 currentColor = tex2D(input,uv);
	
	if(uv.x/Slope + Offset <= uv.y && uv.x/Slope + Offset+Thickness >= uv.y )
    	currentColor = tex2D(input,uv*(1-ZoomFactor));
	
    return currentColor;
}

