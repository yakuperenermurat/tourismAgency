package core;

public class ComboItem {
    // Anahtar ve değer değişkenleri
    private int key;
    private String value;

    // Constructor, anahtar ve değer ile ComboItem nesnesini başlatır
    public ComboItem(int key, String value) {
        this.key = key;
        this.value = value;
    }

    // Anahtar değerini döndürür
    public int getKey() {
        return key;
    }

    // Anahtar değerini ayarlar
    public void setKey(int key) {
        this.key = key;
    }

    // Değer değerini döndürür
    public String getValue() {
        return value;
    }

    // Değer değerini ayarlar
    public void setValue(String value) {
        this.value = value;
    }

    // ComboBox'da gösterilecek değeri döndürür
    public String toString() {
        return this.value;
    }
}