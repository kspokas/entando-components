/*
 * Copyright 2015-Present Entando Inc. (http://www.entando.com) All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.entando.entando.plugins.jpwebform.aps.system.services.form;

import com.agiletec.aps.system.exception.ApsSystemException;
import com.agiletec.aps.util.FileTextReader;
import java.io.InputStream;
import javax.servlet.ServletContext;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * @author E.Santoboni
 */
public class FormUtils {
	
	protected static String getText(String path, ServletContext servletContext) throws Throwable {
		String text = null;
		InputStream is = null;
		try {
			is = servletContext.getResourceAsStream(path);
			text = FileTextReader.getText(is);
		} catch (Throwable t) {
			throw new ApsSystemException("Error readind text", t);
		} finally {
			if (null != is) {
				is.close();
			}
		}
		return text;
	}
	
	public static String getGuiFragmentCode(String formTypeCode, Integer typeVersionCode, String stepCode) {
		String widgetLongKey = "jpwebform_" + formTypeCode + "_" + typeVersionCode + "_" + stepCode;
		return DigestUtils.md5Hex(widgetLongKey);
	}
	
}
