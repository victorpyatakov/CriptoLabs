close all;
clear all;
clc;


q=[1 0 1 0 0 1 1 0 1 0 1 1 1 1 0 0 1];%порождающий многочлен
d=256;% общая длина сообщения

%% 1 block
m=randi(0:1,3,d-length(q)+1);%cлуч сообщение

[ m1,crc1 ] = CRC( m(1,:),q,d );
[ m2,crc2 ] = CRC( m(2,:),q,d );
[ m3,crc3 ] = CRC( m(3,:),q,d );

m1=m1(1,17:end);
m2=m2(1,17:end);%240
m3=m3(1,17:end);

error=[1,zeros(1,239)];%ошибка в канале 1 пает

m1=mod(m1+error,2);
error1=[zeros(1,239),1];%ошибка в канале 3 пакет
m3=mod(m3+error1,2);

crc1=crc1(1,1:16);
crc2=crc2(1,1:16);%16
crc3=crc3(1,1:16);


sec_chanel=[1,zeros(1,length(crc1)-1)];% секр. инф
%%
disp('                    Сгенерировали 3 сообщения длинной 240 бит каждое и обозначили их как m1, m2, m3.');
disp('      ');
disp('Посчитаем для них контрольные суммы и обозначим их как crc1, crc2, crc3.');
disp('      ');
disp('Контрольная сумма 1:');
disp(['crc1=       ','|',num2str(crc1),'|'])
disp('Контрольная сумма 2:');
disp(['crc2=       ','|',num2str(crc2),'|'])
disp('Контрольная сумма 3:');
disp(['crc3=       ','|',num2str(crc3),'|'])
disp('   ');

disp('Внесем в наши контрольные суммы секретную информацию.');
disp(['секр.инф=   ','|',num2str(sec_chanel),'|'])
disp('  ');

disp('После внесения секретной информации получим следующие измененные контрольные суммы crc1*,crc2*,crc3*:');
%%



disp('  ');
disp('Контрольная сумма 1:');
disp(['crc1=       ','|',num2str(crc1),'|'])
disp('           + ');
disp(['секр.инф=   ','|',num2str(sec_chanel),'|'])
disp('           = ');
crc1=mod(crc1+sec_chanel,2);
disp(['crc1*=      ','|',num2str(crc1),'|'])

disp('  ');
disp('Контрольная сумма 2:');
disp(['crc2=       ','|',num2str(crc2),'|'])
disp('           + ');
disp(['секр.инф=   ','|',num2str(sec_chanel),'|'])
disp('           = ');
crc2=mod(crc2+sec_chanel,2);
disp(['crc2*=      ','|',num2str(crc2),'|'])

disp('  ');
disp('Контрольная сумма 3:');
disp(['crc3=       ','|',num2str(crc3),'|'])
disp('           + ');
disp(['секр.инф=   ','|',num2str(sec_chanel),'|'])
disp('           = ');
crc3=mod(crc3+sec_chanel,2);
disp(['crc3*=      ','|',num2str(crc3),'|'])

[ m1_1,crc1_1 ] = CRC( m1,q,d );
[ m2_2,crc2_2 ] = CRC( m2,q,d );%приняли и посчитал контрольную сумму от принятого
[ m3_3,crc3_3 ] = CRC( m3,q,d );

crc1_1=crc1_1(1,1:16);
crc2_2=crc2_2(1,1:16);%16
crc3_3=crc3_3(1,1:16);

disp('  ');
disp('Далее передаем наш пакет состоящий из блока данных и измененной контрольной суммой по каналу,');
disp('в котором происходит ошибки, и допустим ошибка была в первом блоке данных и в третьем. ');
disp('Выделим полученные данные, обозначенные как m1*,m2*,m3* и посчитаем от них контрольные суммы crc1**,crc2**,crc3**.  ');
disp('      ');
disp('Полученная контрольная сумма 1:');
disp(['crc1**=     ','|',num2str(crc1_1),'|'])
disp('Полученная контрольная сумма 2:');
disp(['crc2**=     ','|',num2str(crc2_2),'|'])
disp('Полученная контрольная сумма 3:');
disp(['crc3**=     ','|',num2str(crc3_3),'|'])
disp('   ');
disp('Сложим по модулю полученную контрольную сумму с пришедшей из канала. ');
secret1=mod(crc1+crc1_1,2);
secret2=mod(crc2+crc2_2,2);
secret3=mod(crc3+crc3_3,2);

disp('  ');

disp(['crc1*=      ','|',num2str(crc1),'|'])
disp('           + ');
disp(['crc1**=     ','|',num2str(crc1_1),'|'])
disp('           = ');
disp(['            ','|',num2str(secret1),'|'])
disp('  ');
disp('  ');
disp(['crc2*=      ','|',num2str(crc2),'|'])
disp('           + ');
disp(['crc2**=     ','|',num2str(crc2_2),'|'])
disp('           = ');
disp(['            ','|',num2str(secret2),'|'])
disp('  ');
disp('  ');
disp(['crc3*=      ','|',num2str(crc3),'|'])
disp('           + ');
disp(['crc3**=     ','|',num2str(crc3_3),'|'])
disp('           = ');
disp(['            ','|',num2str(secret3),'|'])



