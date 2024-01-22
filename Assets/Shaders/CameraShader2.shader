Shader "Custom/CameraShader2"
{
	Properties
	{
		_Color("Color",Color)=(1,1,1,1)
		//_MainTex("Texture", 2D) = "white"{}
	}
    SubShader
    {
		Tags { "RenderType" = "Opaque" }
		ZWrite On
		//Cull Off ZWrite Off ZTest Always
        Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			fixed4 _Color;

			struct appdata
			{
				float4 vertex : POSITION;
				//float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				//float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;	
				float depth : DEPTH;
			};

			//Vertex shader
			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.depth = ((UnityObjectToViewPos(v.vertex).z)) * _ProjectionParams.w;
				//o.uv = v.uv;
				return o;
			}
			
			//sampler2D _MainTex;
			//Fragment shader
			fixed4 frag(v2f i) : SV_Target
			{
				//float4 color = tex2D(_MainTex, i.uv);
				//color *= float4(i.uv.x,i.uv.y,1,1);
				
				float invert = 1- i.depth;
				_Color = (invert, invert, invert, 1);
				return _Color;
				//return color;
			}
			ENDCG
		}
    }
}
