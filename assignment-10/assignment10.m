b1=[1 1 1 1 1];a1=1;
b2=[1 1 1 1 1 1 1 1 1 ];a2=1;

b1n=b1/sum(b1);
b2n=b2/sum(b2);

figure;
subplot(2,1,1); freqz(b1n, a1, 1024);title("5-point Moving Average");
subplot(2,1,2); freqz(b2n, a2, 1024); title("9-point Moving Average");

[z1,p1,k1]=tf2zpk(b1n,a1);
[z2,p2,k2]=tf2zpk(b2n,a2);

figure;
subplot(2,1,1); zplane(z1, p1); title("Zero-Pole Plot for 5-point Moving Average");
subplot(2,1,2); zplane(z2, p2); title("Zero-Pole Plot for 9-point Moving Average");