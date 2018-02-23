package ad.infosys.com.storedprocedure.employee;

import java.util.Scanner;

public class Solution {

	static {
		try {
			throw new Exception("variable cannot be resolved");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
		String input = "";
		int T = in.nextInt();
		in.nextLine();
		for (int i = 1; i <= T; i++) {
			input = in.nextLine();

		}

		char[] arr = null;
		for (int i = 0; i < input.length(); i++) {
			arr = input.toCharArray();

		}

		for (int i = 0; i < arr.length; i += 2) {
			System.out.print(arr[i]);
		}
		System.out.print(" ");

		for (int i = 1; i < arr.length; i += 2) {
			System.out.print(arr[i]);
		}

		System.out.println();
		in.close();

	}

}
