//Makin stuff look good
//https://www.youtube.com/watch?v=T-HXmQAMhG0
Shader "Custom/BasicShader"
{
    SubShader
    {
        Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_Position;	
			};

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			float4 frag(v2f i) : SV_Target
			{
				return float4(1,1,1,1);
			}
			ENDCG
		}
    }
}
