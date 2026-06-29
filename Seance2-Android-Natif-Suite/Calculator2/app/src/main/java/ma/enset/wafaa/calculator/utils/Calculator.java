package ma.enset.wafaa.calculator.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;
import java.util.function.Function;

/**
 * Moteur de calcul : évalue une expression mathématique (infix)
 * avec prise en charge des fonctions scientifiques.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class Calculator {

    private static final ArrayList<String> OPERATORS = new ArrayList<String>() {{
        add("+"); add("-"); add("x"); add("/");
    }};

    private static final Map<String, Function<Double, Double>> FUNCTIONS =
            new HashMap<String, Function<Double, Double>>() {{
                put("sin",  Math::sin);
                put("cos",  Math::cos);
                put("tan",  Math::tan);
                put("log",  Math::log);
                put("exp",  Math::exp);
                put("sqrt", Math::sqrt);
                put("abs",  Math::abs);
            }};

    public static double evaluate(String expression) {
        Stack<Double> operandStack  = new Stack<>();
        Stack<Character> operatorStack = new Stack<>();

        for (int i = 0; i < expression.length(); i++) {
            char c = expression.charAt(i);
            if (c == ' ') continue;

            if (Character.isDigit(c) || c == '.') {
                StringBuilder num = new StringBuilder();
                while (i < expression.length() &&
                        (Character.isDigit(expression.charAt(i)) || expression.charAt(i) == '.')) {
                    num.append(expression.charAt(i++));
                }
                i--;
                operandStack.push(Double.parseDouble(num.toString()));

            } else if (c == 'P') {
                operandStack.push(Math.PI);
                i++;

            } else if (c == '(') {
                operatorStack.push(c);

            } else if (c == ')') {
                while (operatorStack.peek() != '(') {
                    operandStack.push(applyOp(operatorStack.pop(), operandStack.pop(), operandStack.pop()));
                }
                operatorStack.pop();

            } else if (isOperator(c)) {
                while (!operatorStack.isEmpty() && precedence(c) <= precedence(operatorStack.peek())) {
                    operandStack.push(applyOp(operatorStack.pop(), operandStack.pop(), operandStack.pop()));
                }
                operatorStack.push(c);

            } else if (Character.isLetter(c)) {
                StringBuilder fname = new StringBuilder();
                while (i < expression.length() && Character.isLetter(expression.charAt(i))) {
                    fname.append(expression.charAt(i++));
                }
                i--;
                if (!FUNCTIONS.containsKey(fname.toString()))
                    throw new IllegalArgumentException("Fonction inconnue : " + fname);

                StringBuilder inner = new StringBuilder();
                int j = i + 2, open = 0;
                while (j < expression.length()) {
                    if (expression.charAt(j) == '(') open++;
                    else if (expression.charAt(j) == ')') {
                        if (open == 0) break;
                        open--;
                    }
                    inner.append(expression.charAt(j++));
                }
                i = j;
                operandStack.push(FUNCTIONS.get(fname.toString()).apply(evaluate(inner.toString())));
            }
        }

        while (!operatorStack.isEmpty()) {
            operandStack.push(applyOp(operatorStack.pop(), operandStack.pop(), operandStack.pop()));
        }
        return operandStack.pop();
    }

    public static boolean isOperator(char c) { return OPERATORS.contains(String.valueOf(c)); }

    private static int precedence(char c) {
        if (c == '+' || c == '-') return 1;
        if (c == 'x' || c == '/') return 2;
        return -1;
    }

    private static double applyOp(char op, double b, double a) {
        switch (op) {
            case '+': return a + b;
            case '-': return a - b;
            case 'x': return a * b;
            case '/':
                if (b == 0) throw new ArithmeticException("Division par zéro !");
                return a / b;
        }
        return 0;
    }
}
