Shader "Custom/Hologram2"
{
    Properties
    {
		//_Color("Color?", Color) = (1,1,1,1)
		_Emission("Color", Color) = (1,1,1,1)
		_Rim("Rim Power", Range(0.1,8.0)) = 3.0
		_i1("Colorvalue1", float) = 1
		_i2("Colorvalue2", float) = 1
    }
    SubShader
    {
		Tags
		{
			"Queue" = "Transparent"
		}
		Pass
		{
			ZWrite On
			ColorMask 0
		}
        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

		struct Input
		{
			//float2 uvMainTex;
			float3 viewDir;
		};
		//fixed4 _Color;
		fixed4 _Emission;
		float _Rim;

		float _i1;
		float _i2;
        

        void surf (Input IN, inout SurfaceOutput o)
        {
			half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
			o.Emission = _Emission.rgb * pow (rim, _Rim) *10;
			o.Alpha = pow( rim, _Rim);
			//half dotp = dot(IN.viewDir, o.Normal);
			//o.Albedo = float3(dotp, _i1,_i2);
			//o.Albedo = _Color.rgb;
			
        }
        ENDCG
    }
    FallBack "Diffuse"
}
