﻿Shader "Custom/CameraShader"
{
   Properties
    {
    }
    SubShader
    {

        CGPROGRAM

		ENDCG
	}
}

/*
Shader "Custom/CameraShader"
{
   Properties
    {
    }
    SubShader
    {

        CGPROGRAM
		#pragma target 2.0 	
		//#pragma surface surf Lambert
		#pragma vertex vert
		#pragma fragment frag
		#include "UnityCG.cginc"

		// ? Vertex position, float3?
		struct appdata
		{
			float4 vertex : POSITION;
		};

		struct v2f
		{
			float4 vertex : SV_POSITION;
			float depth : DEPTH;
		};

		v2f vert (appdata v)
		{
			v2f o;
			o.vertex = UnityObjectToClipPos(v.vertex);
			o.depth = UnityObjectToClipPos(v.vertex).z * _ProjectionParams.w *-1;
			return o;
		}

		fixed4 frag (v2f i) : SV_Target
		{
			float invert = 1- i.depth;
			return (fixed4(invert, invert, invert, 1));
		}
		ENDCG
	}
}
*/