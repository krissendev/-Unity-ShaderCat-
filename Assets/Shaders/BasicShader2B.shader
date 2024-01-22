//Makin stuff look good
//https://www.youtube.com/watch?v=T-HXmQAMhG0
Shader "Custom/BasicShader2B"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white"{}
		_Freq("Frequency", Range(0,5))=3
		_Speed("Speed", Range(0,100))=10
		_Amp("Amplitude", Range(0,1))=0.5
	}
    SubShader
    {
		Cull Off ZWrite Off ZTest Always
        Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			float _Freq;
			float _Speed;
			float _Amp;


			struct something
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_Position;	
			};

			v2f vert(something v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}


			float4 frag(v2f i) : SV_Target
			{
				float t = _Time * _Speed;
				float wH = sin(t * _Freq) * _Amp;

				float4 color = tex2D(_MainTex, i.uv);
				color *= float4(i.uv.x,i.uv.y,1*wH,1*wH);
				return color;
				
			}
			ENDCG
		}
    }
}

