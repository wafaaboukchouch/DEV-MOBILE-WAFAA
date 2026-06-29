package ma.enset.wafaa.calculator.utils;

/**
 * Valeur observable : notifie un Runnable à chaque changement.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class ObservableValue<T> {
    private T value;
    private Runnable onChange;

    public ObservableValue(T value, Runnable onChange) {
        this.value = value;
        this.onChange = onChange;
    }

    public T getValue() { return value; }

    public void setValue(T value) {
        this.value = value;
        if (onChange != null) onChange.run();
    }
}
