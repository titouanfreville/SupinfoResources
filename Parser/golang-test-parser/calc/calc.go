// CAUTION: Generated file - DO NOT EDIT.

package main

import __yyfmt__ "fmt"

import (
	"bufio"
	"fmt"
	"math"
	"os"
)

type yySymType struct {
	yys   int
	value float64
}

type yyXError struct {
	state, xsym int
}

const (
	yyDefault = 57349
	yyEofCode = 57344
	EXIT      = 57347
	NB        = 57346
	NEG       = 57348
	yyErrCode = 57345

	yyMaxDepth = 200
	yyTabOfs   = -18
)

var (
	yyXLAT = map[int]int{
		45:    0,  // '-' (27x)
		10:    1,  // '\n' (19x)
		40:    2,  // '(' (14x)
		57346: 3,  // NB (14x)
		43:    4,  // '+' (13x)
		41:    5,  // ')' (12x)
		61:    6,  // '=' (12x)
		42:    7,  // '*' (11x)
		47:    8,  // '/' (11x)
		94:    9,  // '^' (11x)
		57355: 10, // term (8x)
		57344: 11, // $end (7x)
		57347: 12, // EXIT (7x)
		57353: 13, // expo (7x)
		57354: 14, // fact (5x)
		57352: 15, // expNum (3x)
		57350: 16, // calc (1x)
		57351: 17, // exp (1x)
		57349: 18, // $default (0x)
		57345: 19, // error (0x)
		57348: 20, // NEG (0x)
	}

	yySymNames = []string{
		"'-'",
		"'\\n'",
		"'('",
		"NB",
		"'+'",
		"')'",
		"'='",
		"'*'",
		"'/'",
		"'^'",
		"term",
		"$end",
		"EXIT",
		"expo",
		"fact",
		"expNum",
		"calc",
		"exp",
		"$default",
		"error",
		"NEG",
	}

	yyTokenLiteralStrings = map[int]string{}

	yyReductions = map[int]struct{ xsym, components int }{
		0:  {0, 1},
		1:  {16, 0},
		2:  {16, 2},
		3:  {17, 1},
		4:  {17, 2},
		5:  {17, 2},
		6:  {17, 1},
		7:  {15, 1},
		8:  {15, 3},
		9:  {15, 3},
		10: {14, 1},
		11: {14, 3},
		12: {14, 3},
		13: {13, 1},
		14: {13, 3},
		15: {10, 1},
		16: {10, 2},
		17: {10, 3},
	}

	yyXErrors = map[yyXError]string{}

	yyParseTab = [27][]uint8{
		// 0
		{17, 17, 17, 17, 11: 17, 17, 16: 19},
		{28, 21, 29, 27, 10: 26, 18, 23, 25, 24, 22, 17: 20},
		{16, 16, 16, 16, 11: 16, 16},
		{15, 15, 15, 15, 11: 15, 15},
		{32, 44, 4: 31, 6: 43},
		// 5
		{12, 12, 12, 12, 11: 12, 12},
		{11, 11, 4: 11, 11, 11, 35, 36, 11},
		{8, 8, 4: 8, 8, 8, 8, 8, 38},
		{5, 5, 4: 5, 5, 5, 5, 5, 5},
		{3, 3, 4: 3, 3, 3, 3, 3, 3},
		// 10
		{28, 2: 29, 27, 10: 26, 13: 25, 24, 42},
		{28, 2: 29, 27, 10: 26, 13: 25, 24, 30},
		{32, 4: 31, 33},
		{28, 2: 29, 27, 10: 26, 13: 25, 41},
		{28, 2: 29, 27, 10: 26, 13: 25, 34},
		// 15
		{1, 1, 4: 1, 1, 1, 1, 1, 1},
		{9, 9, 4: 9, 9, 9, 35, 36, 9},
		{28, 2: 29, 27, 10: 26, 13: 40},
		{28, 2: 29, 27, 10: 26, 13: 37},
		{6, 6, 4: 6, 6, 6, 6, 6, 38},
		// 20
		{28, 2: 29, 27, 10: 39},
		{4, 4, 4: 4, 4, 4, 4, 4, 4},
		{7, 7, 4: 7, 7, 7, 7, 7, 38},
		{10, 10, 4: 10, 10, 10, 35, 36, 10},
		{32, 2, 4: 31, 2, 2, 2, 2, 2},
		// 25
		{14, 14, 14, 14, 11: 14, 14},
		{13, 13, 13, 13, 11: 13, 13},
	}
)

var yyDebug = 0

type yyLexer interface {
	Lex(lval *yySymType) int
	Error(s string)
}

type yyLexerEx interface {
	yyLexer
	Reduced(rule, state int, lval *yySymType) bool
}

func yySymName(c int) (s string) {
	x, ok := yyXLAT[c]
	if ok {
		return yySymNames[x]
	}

	if c < 0x7f {
		return __yyfmt__.Sprintf("'%c'", c)
	}

	return __yyfmt__.Sprintf("%d", c)
}

func yylex1(yylex yyLexer, lval *yySymType) (n int) {
	n = yylex.Lex(lval)
	if n <= 0 {
		n = yyEofCode
	}
	if yyDebug >= 3 {
		__yyfmt__.Printf("\nlex %s(%#x %d), lval: %+v\n", yySymName(n), n, n, lval)
	}
	return n
}

func yyParse(yylex yyLexer) int {
	const yyError = 19

	yyEx, _ := yylex.(yyLexerEx)
	var yyn int
	var yylval yySymType
	var yyVAL yySymType
	yyS := make([]yySymType, 200)

	Nerrs := 0   /* number of errors */
	Errflag := 0 /* error recovery flag */
	yyerrok := func() {
		if yyDebug >= 2 {
			__yyfmt__.Printf("yyerrok()\n")
		}
		Errflag = 0
	}
	_ = yyerrok
	yystate := 0
	yychar := -1
	var yyxchar int
	var yyshift int
	yyp := -1
	goto yystack

ret0:
	return 0

ret1:
	return 1

yystack:
	/* put a state and value onto the stack */
	yyp++
	if yyp >= len(yyS) {
		nyys := make([]yySymType, len(yyS)*2)
		copy(nyys, yyS)
		yyS = nyys
	}
	yyS[yyp] = yyVAL
	yyS[yyp].yys = yystate

yynewstate:
	if yychar < 0 {
		yychar = yylex1(yylex, &yylval)
		var ok bool
		if yyxchar, ok = yyXLAT[yychar]; !ok {
			yyxchar = len(yySymNames) // > tab width
		}
	}
	if yyDebug >= 4 {
		var a []int
		for _, v := range yyS[:yyp+1] {
			a = append(a, v.yys)
		}
		__yyfmt__.Printf("state stack %v\n", a)
	}
	row := yyParseTab[yystate]
	yyn = 0
	if yyxchar < len(row) {
		if yyn = int(row[yyxchar]); yyn != 0 {
			yyn += yyTabOfs
		}
	}
	switch {
	case yyn > 0: // shift
		yychar = -1
		yyVAL = yylval
		yystate = yyn
		yyshift = yyn
		if yyDebug >= 2 {
			__yyfmt__.Printf("shift, and goto state %d\n", yystate)
		}
		if Errflag > 0 {
			Errflag--
		}
		goto yystack
	case yyn < 0: // reduce
	case yystate == 1: // accept
		if yyDebug >= 2 {
			__yyfmt__.Println("accept")
		}
		goto ret0
	}

	if yyn == 0 {
		/* error ... attempt to resume parsing */
		switch Errflag {
		case 0: /* brand new error */
			if yyDebug >= 1 {
				__yyfmt__.Printf("no action for %s in state %d\n", yySymName(yychar), yystate)
			}
			msg, ok := yyXErrors[yyXError{yystate, yyxchar}]
			if !ok {
				msg, ok = yyXErrors[yyXError{yystate, -1}]
			}
			if !ok && yyshift != 0 {
				msg, ok = yyXErrors[yyXError{yyshift, yyxchar}]
			}
			if !ok {
				msg, ok = yyXErrors[yyXError{yyshift, -1}]
			}
			if yychar > 0 {
				ls := yyTokenLiteralStrings[yychar]
				if ls == "" {
					ls = yySymName(yychar)
				}
				if ls != "" {
					switch {
					case msg == "":
						msg = __yyfmt__.Sprintf("unexpected %s", ls)
					default:
						msg = __yyfmt__.Sprintf("unexpected %s, %s", ls, msg)
					}
				}
			}
			if msg == "" {
				msg = "syntax error"
			}
			yylex.Error(msg)
			Nerrs++
			fallthrough

		case 1, 2: /* incompletely recovered error ... try again */
			Errflag = 3

			/* find a state where "error" is a legal shift action */
			for yyp >= 0 {
				row := yyParseTab[yyS[yyp].yys]
				if yyError < len(row) {
					yyn = int(row[yyError]) + yyTabOfs
					if yyn > 0 { // hit
						if yyDebug >= 2 {
							__yyfmt__.Printf("error recovery found error shift in state %d\n", yyS[yyp].yys)
						}
						yystate = yyn /* simulate a shift of "error" */
						goto yystack
					}
				}

				/* the current p has no shift on "error", pop stack */
				if yyDebug >= 2 {
					__yyfmt__.Printf("error recovery pops state %d\n", yyS[yyp].yys)
				}
				yyp--
			}
			/* there is no state on the stack with an error shift ... abort */
			if yyDebug >= 2 {
				__yyfmt__.Printf("error recovery failed\n")
			}
			goto ret1

		case 3: /* no shift yet; clobber input char */
			if yyDebug >= 2 {
				__yyfmt__.Printf("error recovery discards %s\n", yySymName(yychar))
			}
			if yychar == yyEofCode {
				goto ret1
			}

			yychar = -1
			goto yynewstate /* try again in the same state */
		}
	}

	r := -yyn
	x0 := yyReductions[r]
	x, n := x0.xsym, x0.components
	yypt := yyp
	_ = yypt // guard against "declared and not used"

	yyp -= n
	if yyp+1 >= len(yyS) {
		nyys := make([]yySymType, len(yyS)*2)
		copy(nyys, yyS)
		yyS = nyys
	}
	yyVAL = yyS[yyp+1]

	/* consult goto table to find next state */
	exState := yystate
	yystate = int(yyParseTab[yyS[yyp].yys][x]) + yyTabOfs
	/* reduction by production r */
	if yyDebug >= 2 {
		__yyfmt__.Printf("reduce using rule %v (%s), and goto state %d\n", r, yySymNames[x], yystate)
	}

	switch r {
	case 3:
		{
			return 0
		}
	case 4:
		{
			fmt.Printf("\t%.10g\n", yyS[yypt-1].value)
		}
	case 5:
		{
			fmt.Printf("\t%.10g\n", yyS[yypt-1].value)
		}
	case 6:
		{
			return 0
		}
	case 8:
		{
			yyVAL.value = yyS[yypt-2].value + yyS[yypt-0].value
		}
	case 9:
		{
			yyVAL.value = yyS[yypt-2].value - yyS[yypt-0].value
		}
	case 11:
		{
			yyVAL.value = yyS[yypt-2].value * yyS[yypt-0].value
		}
	case 12:
		{
			yyVAL.value = yyS[yypt-2].value / yyS[yypt-0].value
		}
	case 14:
		{
			yyVAL.value = math.Pow(yyS[yypt-2].value, yyS[yypt-0].value)
		}
	case 15:
		{
			yyVAL.value = yyS[yypt-0].value
		}
	case 16:
		{
			yyVAL.value = -yyS[yypt-0].value
		}
	case 17:
		{
			yyVAL.value = yyS[yypt-1].value
		}

	}

	if yyEx != nil && yyEx.Reduced(r, exState, &yyVAL) {
		return -1
	}
	goto yystack /* stack new state and value */
}

func main() {
	fmt.Printf("Hello and welcomme on the Golang Yacc Calculator.\n")
	fmt.Printf("Enter your expression using '=' to have the result.\n")
	fmt.Printf("Exit with blank line or 'exit'\n\n")
	os.Exit(yyParse(newLexer(bufio.NewReader(os.Stdin))))
}
