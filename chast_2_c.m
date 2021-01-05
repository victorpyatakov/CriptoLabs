close all;
clear all;
clc;


q=[1 0 1 0 0 1 1 0 1 0 1 1 1 1 0 0 1];%����������� ���������
d=256;% ����� ����� ���������

%% 1 block
m=randi(0:1,3,d-length(q)+1);%c��� ���������

[ m1,crc1 ] = CRC( m(1,:),q,d );
[ m2,crc2 ] = CRC( m(2,:),q,d );
[ m3,crc3 ] = CRC( m(3,:),q,d );

m1=m1(1,17:end);
m2=m2(1,17:end);%240
m3=m3(1,17:end);

error=[1,zeros(1,239)];%������ � ������ 1 ����

m1=mod(m1+error,2);
error1=[zeros(1,239),1];%������ � ������ 3 �����
m3=mod(m3+error1,2);

crc1=crc1(1,1:16);
crc2=crc2(1,1:16);%16
crc3=crc3(1,1:16);


sec_chanel=[1,zeros(1,length(crc1)-1)];% ����. ���
%%
disp('                    ������������� 3 ��������� ������� 240 ��� ������ � ���������� �� ��� m1, m2, m3.');
disp('      ');
disp('��������� ��� ��� ����������� ����� � ��������� �� ��� crc1, crc2, crc3.');
disp('      ');
disp('����������� ����� 1:');
disp(['crc1=       ','|',num2str(crc1),'|'])
disp('����������� ����� 2:');
disp(['crc2=       ','|',num2str(crc2),'|'])
disp('����������� ����� 3:');
disp(['crc3=       ','|',num2str(crc3),'|'])
disp('   ');

disp('������ � ���� ����������� ����� ��������� ����������.');
disp(['����.���=   ','|',num2str(sec_chanel),'|'])
disp('  ');

disp('����� �������� ��������� ���������� ������� ��������� ���������� ����������� ����� crc1*,crc2*,crc3*:');
%%



disp('  ');
disp('����������� ����� 1:');
disp(['crc1=       ','|',num2str(crc1),'|'])
disp('           + ');
disp(['����.���=   ','|',num2str(sec_chanel),'|'])
disp('           = ');
crc1=mod(crc1+sec_chanel,2);
disp(['crc1*=      ','|',num2str(crc1),'|'])

disp('  ');
disp('����������� ����� 2:');
disp(['crc2=       ','|',num2str(crc2),'|'])
disp('           + ');
disp(['����.���=   ','|',num2str(sec_chanel),'|'])
disp('           = ');
crc2=mod(crc2+sec_chanel,2);
disp(['crc2*=      ','|',num2str(crc2),'|'])

disp('  ');
disp('����������� ����� 3:');
disp(['crc3=       ','|',num2str(crc3),'|'])
disp('           + ');
disp(['����.���=   ','|',num2str(sec_chanel),'|'])
disp('           = ');
crc3=mod(crc3+sec_chanel,2);
disp(['crc3*=      ','|',num2str(crc3),'|'])

[ m1_1,crc1_1 ] = CRC( m1,q,d );
[ m2_2,crc2_2 ] = CRC( m2,q,d );%������� � �������� ����������� ����� �� ���������
[ m3_3,crc3_3 ] = CRC( m3,q,d );

crc1_1=crc1_1(1,1:16);
crc2_2=crc2_2(1,1:16);%16
crc3_3=crc3_3(1,1:16);

disp('  ');
disp('����� �������� ��� ����� ��������� �� ����� ������ � ���������� ����������� ������ �� ������,');
disp('� ������� ���������� ������, � �������� ������ ���� � ������ ����� ������ � � �������. ');
disp('������� ���������� ������, ������������ ��� m1*,m2*,m3* � ��������� �� ��� ����������� ����� crc1**,crc2**,crc3**.  ');
disp('      ');
disp('���������� ����������� ����� 1:');
disp(['crc1**=     ','|',num2str(crc1_1),'|'])
disp('���������� ����������� ����� 2:');
disp(['crc2**=     ','|',num2str(crc2_2),'|'])
disp('���������� ����������� ����� 3:');
disp(['crc3**=     ','|',num2str(crc3_3),'|'])
disp('   ');
disp('������ �� ������ ���������� ����������� ����� � ��������� �� ������. ');
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



