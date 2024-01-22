Shader "Custom/NormalShader"
{
    Properties
    {
        _myX("Nx", Range(-10, 10)) = 1
		_myY("Nx", Range(-10, 10)) = 1
		_myZ("Nx", Range(-10, 10)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

		half _myX;
		half _myY;
		half _myZ;
		struct Input
		{
			float2 uv_myDeffuse;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo =1;
			o.Normal = float3(_myX, _myY, _myZ);
		}
        ENDCG
    }
    FallBack "Diffuse"
}
