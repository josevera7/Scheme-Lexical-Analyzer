import java.util.*;

%%

%class SchemeLexicalAnalyzer
%standalone
%unicode
%public
%line
%column

Identifier = {Initial} {Subsequence}* | \+ | \- | \.\.\.
Initial = {Letter} | \! | \$ | \% | \& | \* | \/ | \: | \< | \= | \> | \? | \~ | \_ | \^
Subsequence = {Initial} | {Digit} | \. | \+ | \-
Letter = [A-Za-z]
Digit = [0-9]
Keyword =  if | else | loop | lambda | define | let | cond
Whitespace = [\n \r \t \b \s]+
Boolean = #[fFtT]
Comment = ";"({Identifier} | {Whitespace})+ \n

Number = {Num2} | {Num8} | {Num10} | {Num16}
Sign = "" | \+ | \-

Num2 = {Prefix2} | {Complex2}
Prefix2 = {Radix2} {Exactness} | {Exactness} {Radix2}
Radix2 = \#b
Exactness = ""| \#i | \#e
Complex2 = {Real2} | {Real2} \@ {Real2} | {Real2} \+ {Imag2} | {Real2} \- {Imag2} | \+ {Imag2} | \- {Imag2}
Real2 = {Sign} | {Ureal2}
Imag2 = i | {Ureal2} i
Ureal2 = {Uinteger2} | {Uinteger2} \/ {Uinteger2}
Uinteger2 = {Digit2}+ \#*
Digit2 = 0 | 1

Num8 = {Prefix8} | {Complex8}
Prefix8 = {Radix8} {Exactness} | {Exactness} {Radix8}
Radix8 = \#o
Complex8 = {Real8} | {Real8} \@ {Real8} | {Real8} \+ {Imag8} | {Real8} \- {Imag8} | \+ {Imag8} | \- {Imag8}
Real8 = {Sign} | {Ureal8}
Imag8 = i | {Ureal8} i
Ureal8 = {Uinteger8} | {Uinteger8} \/ {Uinteger8}
Uinteger8 = {Digit8}+ \#*
Digit8 = [0-7]

Num16 = {Prefix16}| {Complex16}
Prefix16 = {Radix16} {Exactness} | {Exactness} {Radix16}
Radix16 = \#x
Complex16 = {Real16} | {Real16} \@ {Real16} | {Real16} \+ {Imag16} | {Real16} \- {Imag16} | \+ {Imag16} | \- {Imag16}
Real16 = {Sign} | {Ureal16}
Imag16 = i | {Ureal16} i
Ureal16 = {Uinteger16} | {Uinteger16} \/ {Uinteger16}
Uinteger16 = {Digit16}+ \#*
Digit16 = {Digit} | [a-f]

Num10 = {Prefix10}| {Complex10}
Prefix10 = {Radix10} {Exactness} | {Exactness} {Radix10}
Radix10 = #d | ""
Complex10 = {Real10} | {Real10} \@ {Real10} | {Real10} \+ {Imag10} | {Real10} \- {Imag10} | \+ {Imag10} | \- {Imag10}
Real10 = {Sign} | {Ureal10}
Imag10 = i | {Ureal10} i
Ureal10 = {Uinteger10} | {Uinteger10} \/ {Uinteger10} | {Decimal}
Uinteger10 = {Digit}+ \#*
Decimal = {Uinteger10} {Exponent} | \. {Digit}+ \#* {Suffix} | {Digit}+ \. {Digit}* \#* {Suffix} | {Digit}+ \#+ \. \#* {Suffix}
Exponent = {ExponentMarker} {Sign} {Digit}+
Suffix = "" | {Exponent}
ExponentMarker = e | f | s | d | l

Character = \#\\{Initial} | \#\n | \#\s
String = \"{Stringcharacter}*\"
Stringcharacter = \" | \\ | {Character}
LeftParen = "("
RightParen = ")"
LeftBracket = "["
RightBracket = "]"
QuotationMark = \"



%%
{Whitespace} {}
{Keyword} {System.out.println("Keyword: " + yytext());}
{Identifier} {System.out.println("Identifier: " + yytext());}
{Number} {System.out.println("Number: " + yytext());}
{String} {System.out.println("String: " + yytext());}
{LeftParen} {System.out.println("Left Parenthesis: " + yytext());}
{RightParen} {System.out.println("Right Parenthesis: " + yytext());}
{Boolean} {System.out.println("Boolean: " + yytext());}
{Comment} {System.out.println("Comment: " + yytext());}
{LeftBracket} {System.out.println("Left Bracket: " + yytext());}
{RightBracket} {System.out.println("Right Bracket: " + yytext());}
{QuotationMark} {System.out.println("QuotationMark: " + yytext());}