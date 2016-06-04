function [Vector1,Vector2,Vector3,Vector4,Vector5]=extract_data(RXXr,meting)
Vector1 = RXXr(meting,:,1);
Vector2 = RXXr(meting,:,2);
Vector3 = RXXr(meting,:,3);
Vector4 = RXXr(meting,:,4);
Vector5 = RXXr(meting,:,5);
end