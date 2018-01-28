module identifiers(
    a,b,c,y,z,

    // initial character have to a-z,A-Z,_
    A,
    Z,
    _,

    // after second character have to a-z,A-Z,_,0-9,$
    A0,
    A$
);

input a,b,c,y,z;
input A,Z,_;
output A0,A$;

endmodule

