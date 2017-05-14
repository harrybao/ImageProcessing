#include <memory.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#define PI 3.1415926
#define CLK_TCK CLOCKS_PER_SEC
int N;
void DCT(double *f,double *F)
{
  int n,m,x;
 double *dTemp = new double[N*N];//中间矩阵
 double *coff = new double[N*N];//变换系数
 coff[0] = 1/sqrt(N);
 for( m=1; m<N; m++ )
  coff[m] = sqrt(2)/sqrt(N);
 memset( dTemp, 0, sizeof(double)*N*N );
 memset( F, 0, sizeof(double)*N*N );
 //一维变换
 for(n=0;n<N;n++)
  for(m=0;m<N;m++)
   for(x=0;x<N;x++)
    dTemp[m*N+n] += f[x*N+n] * coff[m] * cos( (2*x+1) * PI * m/(2*N) );
 //第二次一维变换
 for(m=0;m<N;m++)
  for(n=0;n<N;n++)
   for(x=0;x<N;x++)
    F[m*N+n] += dTemp[m*N+x] * coff[n] * cos( (2*x+1) * PI * n/(2*N) );
 delete []dTemp;
 delete []coff;
}
void iDCT(double *f,double *F)
{
 int m,y,x;
 double *dTemp=new double[N*N];//中间矩阵
 double *coff=new double[N*N];//变换系数
 coff[0]=1/sqrt(N);
 for(m=1;m<N;m++)
  coff[m]=sqrt(2)/sqrt(N);
 memset(dTemp,0,sizeof(double)*N*N);
 memset(F,0,sizeof(double)*N*N);
 //一维变换
 for(x=0;x<N;x++)
  for(y=0;y<N;y++)
   for(m=0;m<N;m++)
    dTemp[x*N+y]+=F[x*N+m]*coff[m]*cos((2*y+1)*PI*m/(2*N));
 //第二次一维变换
 for(y=0;y<N;y++)
  for(x=0;x<N;x++)
   for(m=0;m<N;m++)
    F[x*N+y]+=dTemp[m*N+y]*coff[m]*cos((2*x+1)*PI*m/(2*N));
 delete []dTemp;
 delete []coff;
}
int main()
{ 
  clock_t start,end;
 start=clock();
 int i;
 long L;
 
 printf("变换维数:");
 scanf("%d",&N);
 
 double *f=new double[N*N];//初始矩阵
 double *F=new double[N*N];//变换后输出矩阵 
memset(F,0,sizeof(double)*N*N);//初始化为0
 for(i=0;i<N*N;i++)
 {
  printf("f[%d][%d]:",i/N,i%N);
  scanf("%lf",&f[i]);
 }
 printf("循环次数:");
 scanf("%d",&L);
//输出初始矩阵
 printf("变换前:\n");
 for(i=1;i<=N*N;i++)
 {
  printf("%f\t",f[i-1]);
  if(i%N==0)
   printf("\n");
 }
 for(i=0;i<L;i++)
  DCT(f,F);//变换
//输出变换后矩阵
 printf("变换后:\n");
 for(i=1;i<=N*N;i++)
 {
  printf("%f\t",F[i-1]);
  if(i%N==0)
   printf("\n");
 } 
for(i=0;i<L;i++)
 iDCT(f,F);
 //输出反变换后矩阵
 printf("反变换后:\n");
 for(i=1;i<=N*N;i++)
 {  printf("%f\t",f[i-1]);
  if(i%N==0)
   printf("\n");
 }
 //printf("\n");
 delete []f;
 delete []F;
 end=clock();
 printf("耗时:%f\n",(double)(end-start)/CLK_TCK);
 return 0; 
}

