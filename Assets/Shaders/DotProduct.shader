Shader "Custom/DotProduct"
{
	Properties
	{
		_i1 ("Colorvalue1", float) = 1
		_i2 ("Colorvalue2", float) = 1
	}
    SubShader
    {
        CGPROGRAM
    
        #pragma surface surf Lambert

		float _i1;
		float _i2;

        struct Input
        {
            float3 viewDir;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
			half dotp = dot(IN.viewDir, o.Normal);
            o.Albedo = float3(dotp, _i1,_i2);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
