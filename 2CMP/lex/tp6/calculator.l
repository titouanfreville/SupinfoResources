%{
    int ivar=0;
    int iop=0;
    int var[1000];
    char op[500];
    int calc(int* var, char* op, int ivar, int iop) {
        double diff = (ivar-1) - iop;
        int i,x;
        int i2=1;
        int res=var[0];
        if (diff > 0) {
            ivar -= diff * 2;
        } else if (diff < 0) {
            iop += diff;
        }
        for (i=0; i<iop; i++) {
            x=var[i2]; i2++;
            switch(op[i]) {
                case '*':
                    res*=x; break;
                case '-':
                    res-=x; break;
                case '/':
                    res/=x; break;
                default: 
                    res+=x;
            };
        }
        return res;
    }
%}
%option noyywrap
operateur[\*\+-\/]
%% 
[0-9]+      {var[ivar]=atoi(yytext); ivar++;}
{operateur} {op[iop]=yytext[0]; iop++;}
=           {printf("%d\n\n", calc(var, op, ivar, iop)); ivar=0; iop=0;}
[\n][\n]    {printf("See you later\n"); yyterminate();}
.|\n
%% 
int main(void) {
    printf("Be carefull. This calculator does not implement operation priority AT ALL.\nEnter something: (= after a calc will show the result =. Exit on empty line.)\n");
    yylex();
    return 0; 
}