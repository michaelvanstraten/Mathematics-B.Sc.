public class Langford {

    static final int MAXPAIRS = 21;
    static final int POSITIONS = 41;

    static int n, m, solutions;
    static int k, p;
    static boolean done, successful;
    static int[] a = new int[POSITIONS];
    static int[] previous = new int[POSITIONS];
    static int[] position = new int[MAXPAIRS];

    public static void main(String[] args) {
        n = Integer.parseInt(args[0]);
        if (n == 0) n = 3;
        m = 2 * n;
        initialize();

        while (!done) {
            tryMethod();
            if (successful) lowerPair();
            else higherPair();
        }

        System.out.println(solutions);
    }

    static void initialize() {
        solutions = 0;
        for (p = 1; p <= m; p++) {
            a[p] = 0;
            previous[p] = 0;
        }
        for (k = 1; k <= n; k++) {
            position[k] = 0;
        }
        p = 0;
        k = n;
        done = false;
    }

    static void removePair() {
        p = position[k];
        a[p] = 0;
        a[p + k + 1] = 0;
        // position[k] = 0;
    }

    static void propundity() {
        int q;
        done = true;
        q = m;
        for (p = 1; done && p < q; ) {
            done = a[p] == previous[q];
            p++;
            q--;
        }
        if (!done) {
            solutions++;
            for (p = 1; p <= m; p++) {
                previous[p] = a[p];
            }
            for (k = 1; k <= 1; k++) {
               removePair();
            }
            k = 1;
        }
    }

    static void lowerPair() {
        k--;
        if (k > 0) {
            p = 0;
        } else {
            propundity();
        }
    }

    static void higherPair() {
        k++;
        done = k > n;
        if (!done) {
            removePair();
        }
    }

    static void tryMethod() {
        successful = false;

        for (; !successful && p + k + 1 < m; ) {
            p++;
            successful = (a[p] == 0 && a[p + k + 1] == 0);
        }

        if (successful) {
            a[p] = k;
            a[p + k + 1] = k;
            position[k] = p;
        }
    }
}
