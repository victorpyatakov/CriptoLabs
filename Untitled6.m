close all;
clear all;
clc;


q=[1 0 1 0 0 1 1 0 1 0 1 1 1 1 0 0 1];%порождающий многочлен
d=48;% общая длина сообщения

%% 1 block
m=randi(0:1,3,d-length(q)+1);%cлуч сообщение

[ mess1,m1,crc1 ] = CRC( m(1,:),q,d );
[ mess2,m2,crc2 ] = CRC( m(2,:),q,d );
[ mess3,m3,crc3 ] = CRC( m(3,:),q,d );

% crc=[crc1;crc2;crc3];
% mess=[mess1;mess2;mess3;];
m=[m1;m2;m3];

sec_chanel=[1,zeros(1,d-1)];%второй канал

crc=[mod(crc1+sec_chanel,2);mod(crc2+sec_chanel,2);mod(crc3+sec_chanel,2)];
mess=mod(crc+m,2);

CRC1=CRC_ostatok(mess(1,:),q,d);%для проверки приянтого
CRC2=CRC_ostatok(mess(2,:),q,d);%для проверки приянтого
CRC3=CRC_ostatok(mess(3,:),q,d);%для проверки приянтого

CRC1=CRC1(1:16);
CRC2=CRC2(1:16);
CRC3=CRC3(1:16);

