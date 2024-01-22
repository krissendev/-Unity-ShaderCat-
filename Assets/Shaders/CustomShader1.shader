Shader "Custom/CustomShader1"
{
    Properties
    {
		_AmbientLightColor ("Ambient Light Color", Color) = (1,1,1,1) // defining: var name,  editor name, property type, value
		_AmbientLightIntensity ("Ambient Light Intensity", Range (0.0 ,1.1)) = 1 // defining: var name,  editor name, property type, value
    }
    SubShader
    {
		Pass
		{	
			CGPROGRAM
			// #pragma is a preprocessing function
			#pragma target 2.0 //hardware type?
			#pragma vertex vertexShaderName //defining name of function used as as vertex Shader
			#pragma fragment fragmentShaderName //defining name of function used as as fragment/pixel Shader

			fixed4 _AmbientLightColor; // "Color" is a vector of 4 values
			float _AmbientLightIntensity;

			float4 vertexShaderName(float4 v:POSITION) : SV_POSITION
			{
				return UnityObjectToClipPos(v);
			}
			fixed4 fragmentShaderName() : SV_Target
			{
				return _AmbientLightColor * _AmbientLightIntensity;
			}       
       
			ENDCG
		}
    }
}
