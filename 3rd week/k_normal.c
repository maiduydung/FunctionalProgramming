double quad_eq(double a, double b, double c)
{
    double d = b * b - 4 * a * c;
    return (-b + sqrt(d)) / (2 * a);
}



double quad_eq(double a, double b, double c)
{
    double d, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;

    temp1 = b * b;
    temp2 = a * c;
    temp3 = 4 * temp2;
    d = temp1 - temp3;

    temp4 = sqrt(d);
    temp5 = -1 * b;
    temp6 = temp5 + temp5;

    temp7 = 2 * a;
    temp8 = temp6 / temp7;
    return temp8;



}

