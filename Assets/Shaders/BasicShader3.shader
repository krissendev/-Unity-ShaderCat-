//Makin stuff look good
//https://www.youtube.com/watch?v=T-HXmQAMhG0
Shader "Custom/BasicShader3"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white"
	}
    SubShader
    {
		Tags
		{
			"Queue" = "Transparent"
		}
        Pass
		{
			Blend SrcAlpha OneMinusSrcAlpha
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 vertex : SV_Position;	
				float2 uv : TEXCOORD0;
			};

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

			sampler2D _MainTex;

			float4 frag(v2f i) : SV_Target
			{
			float4 color = tex2D(_MainTex, i.uv);
				return color;
			}
			ENDCG
		}
    }
}
