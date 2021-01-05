close all;
clear all;
clc;

%передаем по каналу с ошибкой,по  2 не передаем, обнаруживаем ошибки
q=[1 0 1 0 0 1 1 0 1 0 1 1 1 1 0 0 1];%порождающий многочлен
d=256;% общая длина сообщения

%% 1 block
m=randi(0:1,3,d-length(q)+1);%cлуч сообщение

[ m1,crc1 ] = CRC( m(1,:),q,d );
[ m2,crc2 ] = CRC( m(2,:),q,d );
[ m3,crc3 ] = CRC( m(3,:),q,d );


m1=m1(17:end);
m2=m2(17:end);
m3=m3(17:end);

noise=[1,zeros(1,length(m1)-1)];



m1=mod(m1+noise,2);
m2=mod(m2+noise,2);
m3=mod(m3+noise,2);


[ m11,crc11 ] = CRC( m1,q,d );
[ m22,crc22 ] = CRC( m2,q,d );
[ m33,crc33 ] = CRC( m3,q,d );

if crc1==crc11
    suka=0;
    suka=suka+1;
end

m1=[zeros(1,16),m1];
m2=[zeros(1,16),m2];
m3=[zeros(1,16),m3];

mes1=mod(m1+crc1,2);
mes2=mod(m2+crc2,2);
mes3=mod(m3+crc3,2);


CRC1=CRC_ostatok(mes1,q,d);%для проверки приянтого
CRC2=CRC_ostatok(mes2,q,d);%для проверки приянтого
CRC3=CRC_ostatok(mes3,q,d);%для проверки приянтого


p = 2; 


% 
% % crc=[crc1;crc2;crc3];
%  mess=[mess1;mess2;mess3;];
% %m=[m1;m2;m3];
% 
% 
% 
% % noise=[zeros(1,d-5),1,1,1,1,1];
% 
% 
% % noise=[noise;noise;noise];
% mess=mod(mess+noise,2);
% 
% 
% 
% 
% 
% CRC1=CRC_ostatok(mess(1,:),q,d);%для проверки приянтого
% CRC2=CRC_ostatok(mess(2,:),q,d);%для проверки приянтого
% CRC3=CRC_ostatok(mess(3,:),q,d);%для проверки приянтого

CRC1=CRC1(1:16);
CRC2=CRC2(1:16);
CRC3=CRC3(1:16);




