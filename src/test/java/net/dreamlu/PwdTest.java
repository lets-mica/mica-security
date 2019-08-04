/*
 * Copyright (c) 2019-2029, Dreamlu 卢春梦 (596392912@qq.com & www.dreamlu.net).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package net.dreamlu;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * Created by lcm on 2018/1/30.
 */
public class PwdTest {
	public static void main(String[] args) throws NoSuchAlgorithmException {

		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4, random);
		for (int i = 0; i < 100; i++) {
			long aa = System.currentTimeMillis();
			String xxx = encoder.encode("1:1" + i);
			long bb = System.currentTimeMillis();
			System.out.println(bb - aa);
		}
	}
}
