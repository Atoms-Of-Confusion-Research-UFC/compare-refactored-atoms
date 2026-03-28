public class AtomsOfConfusion {
    // 1. CONDITIONAL OPERATOR (CO)

    // Com átomo de confusão
    public int conditionalOperatorConfusing(int a) {
        int b = a == 3 ? 2 : 1;
        return b;
    }

    // Refatorado
    public int conditionalOperatorRefactored(int a) {
        int b;
        if (a == 3) {
            b = 2;
        } else {
            b = 1;
        }
        return b;
    }

    // 2. LOGIC AS CONTROL FLOW (LaCF)

    // 2. LOGIC AS CONTROL FLOW (LaCF)

    // Com átomo de confusão
    public int logicAsControlFlowConfusing(int a, int b) {
        if (++a > 0 || ++b > 0);
        return a;
    }

    // Refatorado
    public int logicAsControlFlowRefactored(int a, int b) {
        if (!(a + 1 > 0)) {
            b += 1;
        }
        a += 1;
        return a;
    }

    // 3. PRE-INCREMENT/DECREMENT (Pre-Inc/Dec)

    // Com átomo de confusão
    public int preIncrementConfusing(int b) {
        int a = ++b;
        return a;
    }

    // Refatorado
    public int preIncrementRefactored(int b) {
        b += 1;
        int a = b;
        return a;
    }

    // 4. POST-INCREMENT/DECREMENT (Post-Inc/Dec)

    // Com átomo de confusão
    public int postIncrementConfusing(int b) {
        int a = b++;
        return a + b;
    }

    // Refatorado
    public int postIncrementRefactored(int b) {
        int a = b;
        b += 1;
        return a + b;
    }
}
