package ma.enset.wafaa.calculator.utils;

/**
 * Interface définissant les opérations du calculateur.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public interface CalculatorInterface {
    double evaluate(String expression);
    double applyFunction(String functionName, double value);
}
