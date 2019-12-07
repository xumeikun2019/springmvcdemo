package com.cf.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

public class ExcelOperate{

	public static final String FILE_NAME = "name";
	public static final String CSS_CLASS = "clazz";
	public static final String CSS_STYLE = "style";
	public static final String COLUMN_WIDTHS = "widths";
	public static final String ROW_HEIGHT = "height";
	public static final String CELL_RANGE = "range";
	public static final String CELL_TEXT = "text";
	public static final String FIELD_DATA = "data";
	public static final String FIELD_CELL = "cell";
	public static final String FILE_PATH = "path";

	private static final String CSS_DEFAULT = "-default-";

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	private static Map<String, ExcelCss> cssMap = new HashMap<String, ExcelCss>();
	static {
		try {
			ExcelCss css = new ExcelCss("宋体", (short) 9, HSSFFont.BOLDWEIGHT_NORMAL,
					false);
			cssMap.put(CSS_DEFAULT, css);

			ExcelCss title = css.clone();
			title.setFontHeightInPoints((short) 12);
			title.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cssMap.put("title", title);

			ExcelCss top_title = css.clone();
			top_title.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cssMap.put("top_title", top_title);

			ExcelCss top_label = css.clone();
			top_label.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			top_label.setVerticalAlignment(HSSFCellStyle.VERTICAL_BOTTOM);
			cssMap.put("top_label", top_label);

			ExcelCss top_text = top_label.clone();
			top_text.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cssMap.put("top_text", top_text);

			ExcelCss text = css.clone();
			text.setBorderTop((short) 1);
			text.setBorderBottom((short) 1);
			text.setBorderLeft((short) 1);
			text.setBorderRight((short) 1);
			text.setBackgroundColor(HSSFColor.WHITE.index);
			text.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cssMap.put("text", text);

			ExcelCss normal_text = css.clone();
			normal_text.setBorderTop((short) 1);
			normal_text.setBorderBottom((short) 1);
			normal_text.setBorderLeft((short) 1);
			normal_text.setBorderRight((short) 1);
			cssMap.put("normal_text", normal_text);
			
			ExcelCss text_left = text.clone();
			text_left.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cssMap.put("text_left", text_left);

			ExcelCss text_right = text.clone();
			text_right.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			cssMap.put("text_right", text_right);

			ExcelCss header = text.clone();
			header.setBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
			header.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cssMap.put("header", header);

			ExcelCss header_left = header.clone();
			header_left.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cssMap.put("header_left", header_left);

			ExcelCss header_right = header.clone();
			header_right.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			cssMap.put("header_right", header_right);

			ExcelCss header_tb = header.clone();
			header_tb.setBorderLeft((short) 0);
			header_tb.setBorderRight((short) 0);
			cssMap.put("header_tb", header_tb);

			ExcelCss header_tbl = header.clone();
			header_tbl.setBorderRight((short) 0);
			cssMap.put("header_tbl", header_tbl);

			ExcelCss header_tbr = header.clone();
			header_tbr.setBorderLeft((short) 0);
			cssMap.put("header_tbr", header_tbr);

			ExcelCss label = text.clone();
			// label.setBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
			cssMap.put("label", label);

			ExcelCss label_left = label.clone();
			label_left.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cssMap.put("label_left", label_left);

			ExcelCss label_indent = label_left.clone();
			label_indent.setIndention((short) 1);
			cssMap.put("label_indent", label_indent);

			ExcelCss label_right = label.clone();
			label_right.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			cssMap.put("label_right", label_right);

			ExcelCss bottom_text = css.clone();
			bottom_text.setBorderBottom((short) 1);
			cssMap.put("bottom_text", bottom_text);

			ExcelCss bottom_text_white = bottom_text.clone();
			bottom_text_white.setBackgroundColor(HSSFColor.WHITE.index);
			bottom_text_white.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cssMap.put("bottom_text_white", bottom_text_white);

			ExcelCss bottom_text_left = bottom_text.clone();
			bottom_text_left.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cssMap.put("bottom_text_left", bottom_text_left);

			ExcelCss bottom_text_right = bottom_text.clone();
			bottom_text_right.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			cssMap.put("bottom_text_right", bottom_text_right);

			ExcelCss bottom_label_left = css.clone();
			bottom_label_left.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			cssMap.put("bottom_label_left", bottom_label_left);

			ExcelCss bottom_label_right = css.clone();
			bottom_label_right.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			cssMap.put("bottom_label_right", bottom_label_right);

			ExcelCss tip = css.clone();
			tip.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			tip.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
			cssMap.put("tip", tip);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
	}

	private Map<ExcelCss, HSSFCellStyle> styleMap = new HashMap<ExcelCss, HSSFCellStyle>();

	/**
	 * 默认样式
	 * 
	 * @param hssfWorkbook
	 * @return
	 */
	private HSSFCellStyle getDefaultCellStyle(HSSFWorkbook hssfWorkbook) {
		return getHSSFCellStyle(hssfWorkbook, CSS_DEFAULT, "");
	}

	/**
	 * 获取样式
	 * 
	 * @param hssfWorkbook
	 * @param clazz
	 * @param style
	 * @return
	 */
	private HSSFCellStyle getHSSFCellStyle(HSSFWorkbook hssfWorkbook,
			String clazz, String style) {
		ExcelCss css = null;

		if (clazz != null && !"".equals(clazz)) {

			String[] classes = clazz.split(" ");

			for (String c : classes) {
				c = c.trim();

				if (!"".equals(c) && cssMap.containsKey(c)) {
					css = cssMap.get(c);
					break;
				}
			}
		}

		if (css == null)
			css = cssMap.get(CSS_DEFAULT);

		HSSFCellStyle cellStyle;
		if (styleMap.containsKey(css))
			cellStyle = styleMap.get(css);
		else {
			HSSFFont font = hssfWorkbook.createFont();
			font.setFontName(css.getFontName());
			font.setFontHeightInPoints(css.getFontHeightInPoints());
			font.setBoldweight(css.getBoldweight());
			font.setItalic(css.isItalic());
			font.setStrikeout(css.isStrikeout());
			font.setUnderline(css.getUnderline());
			font.setColor(css.getColor());

			cellStyle = hssfWorkbook.createCellStyle();
			cellStyle.setAlignment(css.getAlignment());
			cellStyle.setVerticalAlignment(css.getVerticalAlignment());
			cellStyle.setBorderTop(css.getBorderTop());
			cellStyle.setBorderBottom(css.getBorderBottom());
			cellStyle.setBorderLeft(css.getBorderLeft());
			cellStyle.setBorderRight(css.getBorderRight());
			cellStyle.setTopBorderColor(css.getTopBorderColor());
			cellStyle.setBottomBorderColor(css.getBottomBorderColor());
			cellStyle.setLeftBorderColor(css.getLeftBorderColor());
			cellStyle.setRightBorderColor(css.getRightBorderColor());
			cellStyle.setFillForegroundColor(css.getBackgroundColor());
			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			cellStyle.setWrapText(css.isWrapText());
			cellStyle.setIndention(css.getIndention());

			cellStyle.setFont(font);

			styleMap.put(css, cellStyle);
		}

		return cellStyle;
	}

	// main调用此方法
	public String buildExcel(JSONObject tableData, OutputStream result)
			throws IOException {

		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(); // 开始实力HSSFWorkbook
		HSSFSheet hssfSheet = hssfWorkbook.createSheet();
		// 获取Excel文件名
		if (tableData.has(FILE_NAME))
			hssfWorkbook.setSheetName(0, tableData.getString(FILE_NAME));

		int rows = 100, cols = 250;
		// 获取自定义的列宽WIDTHS
		if (tableData.has(COLUMN_WIDTHS)) {
			int i = 0;

			JSONArray widths = (JSONArray) tableData.get(COLUMN_WIDTHS);
			for (Object width : widths)
				hssfSheet.setColumnWidth(i++, (Integer) width * 36);

			cols = i;
		}

		String name = null;
		if (tableData.has(FILE_NAME))
			name = (String) tableData.get(FILE_NAME);

		// 获取字符串中的data属性（data属性存放的都是数据的基本信息）
		if (tableData.has(FIELD_DATA)) {
			JSONArray jsonArray = (JSONArray) tableData.get(FIELD_DATA);
			rows = jsonArray.size();

			// 占位符，作为判断每行每列是否需要添加单元格的依据
			HSSFCellStyle[][] placeholder = new HSSFCellStyle[rows][cols];

			int row = 0, orgCol, col = 0;

			for (Object obj : jsonArray) {
				JSONObject jsonObject = (JSONObject) obj;
				HSSFRow hssfRow = hssfSheet.createRow(row);

				Integer height = (Integer) jsonObject.get(ROW_HEIGHT);
				if (height == null)
					height = 25;

				hssfRow.setHeight((short) (height * 16));// 设置本行的行高

				JSONArray jsonArray1 = (JSONArray) jsonObject.get(FIELD_CELL); // 获取cell属性下面的数据

				col = 0;
				// 遍历cell（开始读数据）
				for (Object obj1 : jsonArray1) {
					JSONObject jsonObject1 = (JSONObject) obj1;
					// 获取表格样式（CALSS STYLE）
					String clazz = (String) jsonObject1.get(CSS_CLASS);
					String style = (String) jsonObject1.get(CSS_STYLE);
					// 调用方法获取样式
					HSSFCellStyle cellStyle = getHSSFCellStyle(hssfWorkbook, clazz, style);

					orgCol = col;
					while (placeholder[row][col] != null)
						col++;
					// 获取本行的各列样式信息
					for (; orgCol < col; orgCol++) {
						HSSFCell cell = hssfRow.createCell(orgCol);
						cell.setCellStyle(placeholder[row][orgCol]);
					}

					int rowSpan = 1, colSpan = 1;
					// 获取合并单元格标签
					String range = (String) jsonObject1.get(CELL_RANGE);
					if (range != null) {
						try {
							String[] tmp = range.split("[.]");

							rowSpan = Integer.parseInt(tmp[0]);
							colSpan = Integer.parseInt(tmp[1]);
						} catch (NumberFormatException e) {
						}
					}
					// 获取合并单元格信息
					if (rowSpan > 1 || colSpan > 1)
						hssfSheet.addMergedRegion(new CellRangeAddress(row, row + rowSpan
								- 1, col, col + colSpan - 1));

					HSSFCell hssfCell = hssfRow.createCell(col);
					hssfCell.getCellStyle().cloneStyleFrom(cellStyle);
					// 获取标签text数据（存放的个数据的值）
					Object val = jsonObject1.get(CELL_TEXT);
					if (val instanceof Double)
						hssfCell.setCellValue((Double) val);
					else if (val instanceof Integer)
						hssfCell.setCellValue((Integer) val);
					else if (val instanceof Date)
						hssfCell.setCellValue((Date) val);
					else if (val instanceof Boolean)
						hssfCell.setCellValue((Boolean) val);
					else {
						if (val == null)
							val = "";

						String text = processText(val.toString());

						hssfCell.setCellValue(new HSSFRichTextString(text));
					}

					for (int i = rowSpan - 1; i >= 0; i--)
						for (int j = colSpan - 1; j >= 0; j--)
							placeholder[row + i][col + j] = cellStyle;

					orgCol = col + 1;
					col = col + colSpan;
					for (; orgCol < col; orgCol++) {
						HSSFCell cell = hssfRow.createCell(orgCol);
						cell.setCellStyle(placeholder[row][orgCol]);
					}
				}

				for (; col < cols; col++) {
					HSSFCell cell = hssfRow.createCell(col);
					cell.setCellStyle(placeholder[row][col] == null ? getDefaultCellStyle(hssfWorkbook)
							: placeholder[row][col]);
				}

				row++;
			}
		}

		hssfWorkbook.write(result);
		return name;
	}
	/*// main调用此方法
	public String buildExcel(JSONObject tableData, ByteArrayOutputStream result)
			throws IOException {

		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(); // 开始实力HSSFWorkbook
		HSSFSheet hssfSheet = hssfWorkbook.createSheet();
		// 获取Excel文件名
		if (tableData.has(FILE_NAME))
			hssfWorkbook.setSheetName(0, tableData.getString(FILE_NAME));

		int rows = 100, cols = 250;
		// 获取自定义的列宽WIDTHS
		if (tableData.has(COLUMN_WIDTHS)) {
			int i = 0;

			JSONArray widths = (JSONArray) tableData.get(COLUMN_WIDTHS);
			for (Object width : widths)
				hssfSheet.setColumnWidth(i++, (Integer) width * 36);

			cols = i;
		}

		String name = null;
		if (tableData.has(FILE_NAME))
			name = (String) tableData.get(FILE_NAME);

		// 获取字符串中的data属性（data属性存放的都是数据的基本信息）
		if (tableData.has(FIELD_DATA)) {
			JSONArray jsonArray = (JSONArray) tableData.get(FIELD_DATA);
			rows = jsonArray.size();

			// 占位符，作为判断每行每列是否需要添加单元格的依据
			HSSFCellStyle[][] placeholder = new HSSFCellStyle[rows][cols];

			int row = 0, orgCol, col = 0;

			for (Object obj : jsonArray) {
				JSONObject jsonObject = (JSONObject) obj;
				HSSFRow hssfRow = hssfSheet.createRow(row);

				Integer height = (Integer) jsonObject.get(ROW_HEIGHT);
				if (height == null)
					height = 25;

				hssfRow.setHeight((short) (height * 16));// 设置本行的行高

				JSONArray jsonArray1 = (JSONArray) jsonObject.get(FIELD_CELL); // 获取cell属性下面的数据

				col = 0;
				// 遍历cell（开始读数据）
				for (Object obj1 : jsonArray1) {
					JSONObject jsonObject1 = (JSONObject) obj1;
					// 获取表格样式（CALSS STYLE）
					String clazz = (String) jsonObject1.get(CSS_CLASS);
					String style = (String) jsonObject1.get(CSS_STYLE);
					// 调用方法获取样式
					HSSFCellStyle cellStyle = getHSSFCellStyle(hssfWorkbook, clazz, style);

					orgCol = col;
					while (placeholder[row][col] != null)
						col++;
					// 获取本行的各列样式信息
					for (; orgCol < col; orgCol++) {
						HSSFCell cell = hssfRow.createCell(orgCol);
						cell.setCellStyle(placeholder[row][orgCol]);
					}

					int rowSpan = 1, colSpan = 1;
					// 获取合并单元格标签
					String range = (String) jsonObject1.get(CELL_RANGE);
					if (range != null) {
						try {
							String[] tmp = range.split("[.]");

							rowSpan = Integer.parseInt(tmp[0]);
							colSpan = Integer.parseInt(tmp[1]);
						} catch (NumberFormatException e) {
						}
					}
					// 获取合并单元格信息
					if (rowSpan > 1 || colSpan > 1)
						hssfSheet.addMergedRegion(new CellRangeAddress(row, row + rowSpan
								- 1, col, col + colSpan - 1));

					HSSFCell hssfCell = hssfRow.createCell(col);
					hssfCell.setCellStyle(cellStyle);
					// 获取标签text数据（存放的个数据的值）
					Object val = jsonObject1.get(CELL_TEXT);
					if (val instanceof Double)
						hssfCell.setCellValue((Double) val);
					else if (val instanceof Integer)
						hssfCell.setCellValue((Integer) val);
					else if (val instanceof Date)
						hssfCell.setCellValue((Date) val);
					else if (val instanceof Boolean)
						hssfCell.setCellValue((Boolean) val);
					else {
						if (val == null)
							val = "";

						String text = processText(val.toString());

						hssfCell.setCellValue(new HSSFRichTextString(text));
					}

					for (int i = rowSpan - 1; i >= 0; i--)
						for (int j = colSpan - 1; j >= 0; j--)
							placeholder[row + i][col + j] = cellStyle;

					orgCol = col + 1;
					col = col + colSpan;
					for (; orgCol < col; orgCol++) {
						HSSFCell cell = hssfRow.createCell(orgCol);
						cell.setCellStyle(placeholder[row][orgCol]);
					}
				}

				for (; col < cols; col++) {
					HSSFCell cell = hssfRow.createCell(col);
					cell.setCellStyle(placeholder[row][col] == null ? getDefaultCellStyle(hssfWorkbook)
							: placeholder[row][col]);
				}

				row++;
			}
		}

		hssfWorkbook.write(result);
		return name;
	}*/
	public Map<String, Object> readExcelData(InputStream is, String readConfig) {
		// readConfig 格式如："1.1 1.3 3.1 ...17.4 "
		HSSFWorkbook hssfWorkbook;
		try {
			hssfWorkbook = new HSSFWorkbook(is);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Excel输入流有误，请检查选择的Excel文件!");
		}

		HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);

		int[][] placeholder = createPlaceHolder(hssfSheet);
		int rows = placeholder.length;
		int cols = placeholder[0].length;

		Map<String, Object> result = new HashMap<String, Object>();

		int currRow = -1;
		HSSFRow hssfRow = null;

		String[] tmp = readConfig.split(" ");
		for (String s : tmp) {
			String key = s.trim();
			String[] pos = key.trim().split("[.]");
			int row = Integer.parseInt(pos[0]);
			int col = Integer.parseInt(pos[1]);
			if (row >= rows)
				continue;

			int index = 0;
			for (int cnt = col; index < cols; index++) {
				if (placeholder[row][index] == 0) {
					cnt--;

					if (cnt < 0)
						break;
				}
			}

			if (index >= cols)
				continue;

			if (row != currRow)
				hssfRow = hssfSheet.getRow(row);

			HSSFCell hssfCell = hssfRow.getCell(index);

			Object val = null;
			switch (hssfCell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case HSSFCell.CELL_TYPE_NUMERIC:
			case HSSFCell.CELL_TYPE_FORMULA:
				if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
					Date date = hssfCell.getDateCellValue();

					val = sdf.format(date);
				} else
					val = hssfCell.getNumericCellValue();

				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				val = hssfCell.getBooleanCellValue();

				break;
			case HSSFCell.CELL_TYPE_STRING:
				HSSFRichTextString text = hssfCell.getRichStringCellValue();
				val = text.getString();

				break;
			default:
				val = "";
			}

			result.put(key, val);
			// System.out.println(row + "-" + col + ":" + val);
		}

		return result;
	}

	private int[][] createPlaceHolder(HSSFSheet hssfSheet) {
		int rows = hssfSheet.getLastRowNum() + 1;
		int cols = 0;

		// 计算最大列数量
		for (int row = 0; row < rows; row++) {
			HSSFRow hssfRow = hssfSheet.getRow(row);
			if (hssfRow.getLastCellNum() > cols)
				cols = hssfRow.getLastCellNum();
		}

		int[][] placeholder = new int[rows][cols];

		System.out.println(rows + "," + cols);

		for (int i = 0, length = hssfSheet.getNumMergedRegions(); i < length; i++) {

			CellRangeAddress range = hssfSheet.getMergedRegion(i);

			for (int beginRow = range.getFirstRow(), endRow = range.getLastRow(); beginRow <= endRow; beginRow++)
				for (int beginCol = range.getFirstColumn(), endCol = range
						.getLastColumn(); beginCol <= endCol; beginCol++)
					placeholder[beginRow][beginCol] = 1;

			placeholder[range.getFirstRow()][range.getFirstColumn()] = 0;
		}

		return placeholder;
	}

	private String processText(String text) {
		text = text.replaceAll("<BR>", "\n");
		text = text.replaceAll("<br>", "\n");
		text = text.replaceAll("<[/]*[^>]*>", "");
		text = text.replaceAll("&nbsp;", " ");

		return text;
	}

	public List<Object[]> readAllExcels(String filePath, int readRow)
			throws IOException {

		FileInputStream is = new FileInputStream(filePath);
		HSSFWorkbook wbs = new HSSFWorkbook(is);
		HSSFSheet childSheet = wbs.getSheetAt(0);

		List<Object[]> list = new ArrayList<Object[]>();

		// System.out.println(childSheet.getPhysicalNumberOfRows());
		System.out.println("有行数" + (childSheet.getLastRowNum() + 1));
		// 是否读取第一行
		for (int j = readRow; j <= childSheet.getLastRowNum(); j++) {
			HSSFRow row = childSheet.getRow(j);
			// System.out.println(row.getPhysicalNumberOfCells());
			// System.out.println("有列数" + row.getLastCellNum());
			if (null != row) {
				Object[] obj = new Object[row.getLastCellNum()];
				for (int k = 0; k < row.getLastCellNum(); k++) {
					HSSFCell cell = row.getCell(k);
					if (null != cell) {
						switch (cell.getCellType()) {
						case HSSFCell.CELL_TYPE_NUMERIC: // 数字
							obj[k] = cell.getNumericCellValue();
							break;
						case HSSFCell.CELL_TYPE_STRING: // 字符串
							obj[k] = cell.getStringCellValue();
							break;
						case HSSFCell.CELL_TYPE_BOOLEAN: // Boolean
							obj[k] = cell.getBooleanCellValue();
							break;
						case HSSFCell.CELL_TYPE_FORMULA: // 公式
							obj[k] = cell.getCellFormula();
							break;
						case HSSFCell.CELL_TYPE_BLANK: // 空值
							obj[k] = " ";
							break;
						case HSSFCell.CELL_TYPE_ERROR: // 故障
							obj[k] = "数据有误";
							break;
						default:
							obj[k] = "未知类型";
							break;
						}
					} else {
						// System.out.print("-   ");
						continue;
					}
				}
				list.add(obj);
			}
			System.out.println();

		}

		return list;

	}

	public static void main(String[] args) throws IOException {
//		 String s =
//		 "{'widths':[98,101,151,207,86,155],'data':[{'height':34,'cell':[{'text':'我的报表','range':'1.6','clazz':'title'}]},{'height':20,'cell':[{'text':'录入人：','clazz':'top_label'},{'text':'zouxuem','range':'1.2','clazz':'top_text'},{'text':'录入日期：','clazz':'top_label'},{'text':'2009-03-15','range':'1.2','clazz':'top_text'}]},{'height':28,'cell':[{'text':'与上年度比较能耗指标下降的分析说明','range':'1.6','clazz':'top_title'}]},{'height':28,'cell':[{'text':'单据号：','clazz':'label_right'},{'text':'666','range':'1.2','clazz':'text'},{'text':'购买客户：','clazz':'label_right'},{'text':'customer1','range':'1.2','clazz':'text'}]},{'height':28,'cell':[{'text':'单据说明：','clazz':'label_right'},{'text':'','range':'1.5','clazz':'text'}]},{'height':28,'cell':[{'text':'商品','clazz':'header'},{'text':'单位','clazz':'header'},{'text':'单价','clazz':'header'},{'text':'数量','clazz':'header'},{'text':'金额','clazz':'header'},{'text':'操作','clazz':'header'}]},{'height':32,'cell':[{'text':'苹果','clazz':'text'},{'text':'qk','range':'3.1','clazz':'text'},{'text':'22.34','clazz':'text'},{'text':'66','clazz':'text'},{'text':'1474.4','clazz':'text'},{'text':'','clazz':'text'}]},{'height':32,'cell':[{'text':'香蕉','clazz':'text'},{'text':'12.34','clazz':'text'},{'text':'10','clazz':'text'},{'text':'123.4','clazz':'text'},{'text':'','clazz':'text'}]},{'height':32,'cell':[{'text':'桔子','clazz':'text'},{'text':'24.34','clazz':'text'},{'text':'100','clazz':'text'},{'text':'2434.0','clazz':'text'},{'text':'','clazz':'text'}]},{'height':32,'cell':[{'text':'油菜','clazz':'text'},{'text':'ton','range':'2.1','clazz':'text'},{'text':'62.34','clazz':'text'},{'text':'5','clazz':'text'},{'text':'311.7','clazz':'text'},{'text':'','clazz':'text'}]},{'height':32,'cell':[{'text':'黄瓜','clazz':'text'},{'text':'42.34','clazz':'text'},{'text':'5','clazz':'text'},{'text':'211.7','clazz':'text'},{'text':'','clazz':'text'}]},{'height':32,'cell':[{'text':'','clazz':'text'},{'text':'','clazz':'text'},{'text':'','clazz':'text'},{'text':'','clazz':'text'},{'text':'4555.2','clazz':'text'},{'text':'','clazz':'text'}]},{'height':28,'cell':[{'text':'与上年度比较能耗指标上升的分析说明','range':'1.6','clazz':'top_title'}]},{'height':20,'cell':[{'text':'录入人：','clazz':'top_label'},{'text':'zouxuem','range':'1.2','clazz':'top_text'},{'text':'录入日期：','clazz':'top_label'},{'text':'2009-03-15','range':'1.2','clazz':'top_text'}]},{'height':28,'cell':[{'text':'单据号：','clazz':'label_right'},{'text':'yyy','range':'1.2','clazz':'text'},{'text':'购买客户：','clazz':'label_right'},{'text':'customer1','range':'1.2','clazz':'text'}]},{'height':28,'cell':[{'text':'单据说明：','clazz':'label_right'},{'text':'','range':'1.5','clazz':'text'}]},{'height':28,'cell':[{'text':'商品','clazz':'header'},{'text':'单位','clazz':'header'},{'text':'单价','clazz':'header'},{'text':'数量','clazz':'header'},{'text':'金额','clazz':'header'},{'text':'操作','clazz':'header'}]},{'height':20,'cell':[{'text':'总金额：','clazz':'bottom_label_right'},{'text':'9110','clazz':'bottom_text'},{'text':'','clazz':'bottom_label_right'},{'text':'审批人：','clazz':'bottom_label_right'},{'text':'liupeng','clazz':'bottom_text'},{'text':'','clazz':'bottom_label_right'}]},{'height':20,'cell':[{'text':'','range':'1.6','clazz':'tip'}]},{'height':20,'cell':[{'text':'说明：1．从填报年度开始的三年为一个规划期。（如2008年度能源利用状况报告，则规划期为2008—2010三年。）','range':'1.6','clazz':'tip'}],'style':'height: 20px;'},{'height':37,'cell':[{'text':'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2．项目类别：燃煤工业锅炉(窑炉)改造／发电（供热）机组／区域热电联产／余热余压利用／节约和替代石油／电机系统节能／能量<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统优化／建筑节能／绿色照明。','range':'1.6','clazz':'tip'}],'style':'height: 37px;'},{'height':16,'cell':[{'text':'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3．项目年节能量达到3000吨标准煤以上或投资金额1000万以上的节能技改项目均应填报。','range':'1.6','clazz':'tip'}],'style':'height: 16px;'}],'clazz':'report','style':'width: 798px;','name':'我的报表'}";
//		String s = "{'widths':[98,101,151,207,86,155],'data':[{'height':28,'cell':[{'text':'商品','clazz':'header'},"
//				+ "{'text':'单位','clazz':'header'},{'text':'单价','clazz':'header'},{'text':'数量','clazz':'header'},{'text':'金额','clazz':'header'},"
//				+ "{'text':'操作','clazz':'header'}]},{'height':32,'cell':[{'text':'苹果1','clazz':'text'},{'text':'qk','clazz':'text'},"
//				+ "{'text':'22.34','clazz':'text'},{'text':'66','clazz':'text'},{'text':'1474.4','clazz':'text'},{'text':'','clazz':'text'}]},"
//				+ "{'height':32,'cell':[{'text':'苹果2','clazz':'text'},{'text':'qk','clazz':'text'},{'text':'22.34','clazz':'text'},"
//				+ "{'text':'66','clazz':'text'},{'text':'1474.4','clazz':'text'},{'text':'','clazz':'text'}]},{'height':32,'cell':[{'text':'苹果3','clazz':'text'},"
//				+ "{'text':'qk','clazz':'text'},{'text':'22.34','clazz':'text'},{'text':'66','clazz':'text'},{'text':'1474.4','clazz':'text'},{'text':'','clazz':'text'}]},"
//				+ "{'height':32,'cell':[{'text':'苹果4','clazz':'text'},{'text':'qk','clazz':'text'},{'text':'22.34','clazz':'text'},{'text':'66','clazz':'text'},"
//				+ "{'text':'1474.4','clazz':'text'},{'text':'','clazz':'text'}]}],'clazz':'report','style':'width: 798px;','name':'我的报表'}";
//		String s = "{'name':'a',"
//				+ "'data':"
//				+ "[{'height':25,"
//				+ "'cell':"
//				+ "[{'text':'主键','clazz':'header'},{'text':'标题','clazz':'header'},{'text':'内容','clazz':'header'}]},"
//				+ "{'height':25,'cell':[{'text':'917e508ea4904540b19dc3f94f56d756','clazz':'text'},{'text':'4444','clazz':'text'},{'text':'44444text_left使用44444text_left使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用帮助使用','clazz':'text'}]},"
//				+ "{'height':25,'cell':[{'text':'7827e3b5b5f04e048acd6dcea077fc9a','clazz':'text'},{'text':'ffffff','clazz':'text'},{'text':'fffffffffffff','clazz':'text'}]}],"
//				+ "'widths':[207,207,207,207,207,207,207,207,207],'clazz':'report','style':'width: 621px;'}";
String s = "{ 'widths': [ 50, 150, 300 ], 'data': [ { 'height': 28, 'cell': [ { 'text': '序号', 'clazz': 'header' }, { 'text': '姓名', 'clazz': 'header' }, { 'text': '地址', 'clazz': 'header' } ] }, { 'height': 20, 'cell': [ { 'text': '1', 'clazz': 'normal_text' }, { 'text': '12', 'clazz': 'normal_text' }, { 'text': '许', 'clazz': 'normal_text' } ] }, { 'height': 20, 'cell': [ { 'text': '2', 'clazz': 'normal_text' }, { 'text': 'sdf', 'clazz': 'normal_text' }, { 'text': '3', 'clazz': 'normal_text' } ] }, { 'height': 20, 'cell': [ { 'text': '3', 'clazz': 'normal_text' }, { 'text': 'sdf+', 'clazz': 'normal_text' }, { 'text': '企业', 'clazz': 'normal_text' } ] }, { 'height': 20, 'cell': [ { 'text': '4', 'clazz': 'normal_text' }, { 'text': '负担是多少', 'clazz': 'normal_text' }, { 'text': '命名', 'clazz': 'normal_text' } ] }, { 'height': 20, 'cell': [ { 'text': '5', 'clazz': 'normal_text' }, { 'text': '分多个', 'clazz': 'normal_text' }, { 'text': '命名', 'clazz': 'normal_text' } ] } ], 'clazz': 'report', 'style': 'width: 798px;' }";
		System.out.println(s);
//		 String s=
//		 "{'widths':[98,101,151,207,86,155],'data':[{'height':28,'cell':[{'text':'商品'},"
//		 +
//		 "{'text':'单位'},{'text':'单价'},{'text':'数量'},{'text':'金额'}," +
//		 "{'text':'操作'}]},{'height':32,'cell':[{'text':'苹果1'},{'text':'qk'}," +
//		 "{'text':'22.34'},{'text':'66'},{'text':'1474.4'},{'text':''}]}," +
//		 "{'height':32,'cell':[{'text':'苹果2'},{'text':'qk'},{'text':'22.34'}," +
//		 "{'text':'66'},{'text':'1474.4'},{'text':''}]},{'height':32,'cell':[{'text':'苹果3'},"
//		 +
//		 "{'text':'qk'},{'text':'22.34'},{'text':'66'},{'text':'1474.4'},{'text':''}]},"
//		 +
//		 "{'height':32,'cell':[{'text':'苹果4'},{'text':'qk'},{'text':'22.34'},{'text':'66'},"
//		 +
//		 "{'text':'1474.4'},{'text':''}]}],'clazz':'report','style':'width: 798px;','name':'我的报表'}";
//		
//		 String ss = "{'widths':[50,150,300],'data':[{'height':28,'cell':[{'text':'序号','clazz':'header'},{'text':'姓名','clazz':'header'},{'text':'地址','clazz':'header'}]},{'height':20,'cell':[{'text':'1','clazz':'normal_text'},{'text':'12','clazz':'normal_text'},{'text':'许','clazz':'normal_text'}]},{'height':20,'cell':[{'text':'2','clazz':'normal_text'},{'text':'sdf','clazz':'normal_text'},{'text':'3','clazz':'normal_text'}]},{'height':20,'cell':[{'text':'3','clazz':'normal_text'},{'text':'sdf+','clazz':'normal_text'},{'text':'企业','clazz':'normal_text'}]},{'height':20,'cell':[{'text':'4','clazz':'normal_text'},{'text':'负担是多少','clazz':'normal_text'},{'text':'命名','clazz':'normal_text'}]},{'height':20,'cell':[{'text':'5','clazz':'normal_text'},{'text':'分多个','clazz':'normal_text'},{'text':'命名','clazz':'normal_text'}]}],'clazz':'report','style':'width: 798px;','name':'sheet1'}";
		JSONObject jsonObj = JSONObject.fromObject(s);

		FileOutputStream fo = new FileOutputStream("E://example.xls");

		ExcelOperate excelOperate = new ExcelOperate();
		excelOperate.buildExcel(jsonObj, fo);
		fo.close();

		System.out.println("export ok!!!");

//		 String s =
//		 "1.1 1.3 3.1 3.3 4.1 6.0 6.1 6.2 6.3 6.4 7.0 7.1 7.2 7.3 8.0 8.1 8.2 8.3 9.0 9.1 9.2 9.3 9.4 10.0 10.1 10.2 10.3 11.0 11.1 11.2 11.3 11.4 13.1 13.3 14.1 14.3 15.1 17.1";
//		
//		 FileInputStream fi = new FileInputStream("./example.xls");
//		 ExcelOperate excelOperate = new ExcelOperate();
//		 Map<String, Object> result = excelOperate.readExcelData(fi, s);
//		 fi.close();
//
//		 JSONObject jsonObj = JSONObject.fromObject(result);
//		 System.out.println(jsonObj);
//		
//		 System.out.println("import ok!!!");

		// System.out.println("==="+result.get("3.1"));

		// ExcelOperate excelOperate = new ExcelOperate();
		// List<Object[]> list = excelOperate.readAllExcels("./example.xls",0);
		// for(int i=0; i< list.size(); i++){
		// Object[] str = list.get(i);
		// for(int j = 0; j<str.length; j++){
		// System.out.println("第"+(i+1)+"行，第"+j+"列数据为："+str[j]);
		// }
		// }

	}

}
