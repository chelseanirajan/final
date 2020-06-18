package com.jugal.adminsecurity.user.utils;

import com.jugal.adminsecurity.model.User;
import com.jugal.adminsecurity.user.model.Student;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellUtil;
import org.apache.poi.ss.util.PropertyTemplate;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class ExcelUtils {
    public static void setMergedCell(Sheet sheet, String text, int... cellRanges) {
        Row row = sheet.createRow((short) cellRanges[0]);
        Cell cell = row.createCell((short) cellRanges[2]);
        cell.setCellValue(text);
        sheet.addMergedRegion(new CellRangeAddress(
                cellRanges[0], //first row (0-based)
                cellRanges[1], //last row  (0-based)
                cellRanges[2], //first column (0-based)
                cellRanges[3]  //last column  (0-based)
        ));
        CellUtil.setAlignment(cell, HorizontalAlignment.CENTER);
    }

    public static void createCell(Row row, int var, CellStyle cellStyle, String text,int... cellRanges) {
        Cell cell = row.createCell(var);
        cellStyle.setBorderBottom(BorderStyle.MEDIUM);
        cellStyle.setBorderTop(BorderStyle.MEDIUM);
        cellStyle.setBorderRight(BorderStyle.MEDIUM);
        cellStyle.setBorderLeft(BorderStyle.MEDIUM);
        cell.setCellValue(text);
        cell.setCellStyle(cellStyle);
    }
    public static void createCell1(Row row, int var, CellStyle cellStyle, String text,int... cellRanges) {
        Cell cell = row.createCell(var);
        cell.setCellValue(text);
        cell.setCellStyle(cellStyle);
    }

    public static ByteArrayInputStream productsToExcel(List<Student> products, User user) throws IOException {
        String[] COLUMNs = {"Id", "Roll No", "Student Name", "DoB", "Father Name",
                            "Mother Name","ETh","EPr","Total","NTh","NPr","Total","MTh",
                "STh","SPr","Total","SoTh","SoPr","Total","OTh","Opr",
                            "Total","HTh","HPr","Total","MTh","MPr","Total","CTh","CPr","Total",
                            "Grand Total"};
        try (
                Workbook workbook = new XSSFWorkbook();
                ByteArrayOutputStream out = new ByteArrayOutputStream();
        ) {
            CreationHelper createHelper = workbook.getCreationHelper();
            //cs.setVerticalAlignment(VerticalAlignment.CENTER);
            Sheet sheet = workbook.createSheet("MarkLeadger");
            ExcelUtils.setMergedCell(sheet, "Rural Municipality Level Examination Board", 0, 0, 0, 31);
            ExcelUtils.setMergedCell(sheet,  "Basic Level Examination "+products.get(0).getYear(), 1, 1, 0, 31);
            ExcelUtils.setMergedCell(sheet,  "Jugal Gaupalika", 2, 2, 0, 31);
            Row row8 = sheet.createRow(3);
            Cell cell6 = row8.createCell(0);
            cell6.setCellValue("Mark ledger "+products.get(0).getYear());
            Row row9 = sheet.createRow(4);
            Cell cell9 = row9.createCell(0);
            cell9.setCellValue("School: "+user.getSchoolName()+" "+user.getSchoolAddress());
            Row row10 = sheet.createRow(5);
            Cell cell10 = row10.createCell(0);
            cell10.setCellValue("Class: 8");
            //ExcelUtils.setMergedCell(sheet,  "Mark ledger "+products.get(1).getYear(, 3, 3, 0, 1);
            //ExcelUtils.setMergedCell(sheet,"School: "+user.getSchoolName()+" "+user.getSchoolAddress(), 4, 4, 0, 5);
            //ExcelUtils.setMergedCell(sheet,  "Class: 8", 5, 5, 0, 1);

            Header header = sheet.getHeader();
            //header.setCenter("Center Header");
            Font headerFont = workbook.createFont();
            headerFont.setBold(true);
            headerFont.setColor(IndexedColors.BLUE.getIndex());
            CellStyle headerCellStyle = workbook.createCellStyle();
            headerCellStyle.setFont(headerFont);
            headerCellStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
            headerCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

            // Row for Header
            Row headerRow = sheet.createRow(6);
            for (int col = 0; col < COLUMNs.length; col++) {
                ExcelUtils.createCell(headerRow, col, headerCellStyle, COLUMNs[col]);
            }


            // CellStyle for Age
            CellStyle ageCellStyle = workbook.createCellStyle();
            ageCellStyle.setDataFormat(createHelper.createDataFormat().getFormat("#"));
            CellStyle headerCellStyle1 = workbook.createCellStyle();
            headerCellStyle.setWrapText(true);
            int rowIdx = 7;
            for (Student std : products) {
                Row row = sheet.createRow(rowIdx++);

                ExcelUtils.createCell(row, 0, headerCellStyle1,String.valueOf(std.getId()));
                ExcelUtils.createCell(row, 1, headerCellStyle1,String.valueOf(std.getRollNo()));
                ExcelUtils.createCell(row, 2, headerCellStyle1,std.getName());
                ExcelUtils.createCell(row, 3, headerCellStyle1,std.getDoB());
                ExcelUtils.createCell(row, 4, headerCellStyle1,std.getFatherName());
                ExcelUtils.createCell(row, 5, headerCellStyle1,std.getMotherName());
                ExcelUtils.createCell(row, 6, headerCellStyle1,String.valueOf(std.getEnglishTh()));
                ExcelUtils.createCell(row, 7, headerCellStyle1,String.valueOf(std.getEnglishPr()));
                ExcelUtils.createCell(row, 8, headerCellStyle1,String.valueOf(std.getEnglishTh()+std.getEnglishPr()));
                ExcelUtils.createCell(row, 9, headerCellStyle1,String.valueOf(std.getNepaliTh()));
                ExcelUtils.createCell(row, 10, headerCellStyle1,String.valueOf(std.getNepaliPr()));
                ExcelUtils.createCell(row, 11, headerCellStyle1,String.valueOf(std.getNepaliTh()+std.getNepaliPr()));
                ExcelUtils.createCell(row, 12, headerCellStyle1,String.valueOf(std.getMathTh()));
                ExcelUtils.createCell(row, 13, headerCellStyle1,String.valueOf(std.getScienceTh()));
                ExcelUtils.createCell(row, 14, headerCellStyle1,String.valueOf(std.getSciencePr()));
                ExcelUtils.createCell(row, 15, headerCellStyle1,String.valueOf(std.getScienceTh()+std.getSciencePr()));
                ExcelUtils.createCell(row, 16, headerCellStyle1,String.valueOf(std.getSocialTh()));
                ExcelUtils.createCell(row, 17, headerCellStyle1,String.valueOf(std.getSocialPr()));
                ExcelUtils.createCell(row, 18, headerCellStyle1,String.valueOf(std.getSocialTh()+std.getSocialPr()));
                ExcelUtils.createCell(row, 19, headerCellStyle1,String.valueOf(std.getObtTh()));
                ExcelUtils.createCell(row, 20, headerCellStyle1,String.valueOf(std.getObtPr()));
                ExcelUtils.createCell(row, 21, headerCellStyle1,String.valueOf(std.getObtTh()+std.getObtPr()));
                ExcelUtils.createCell(row, 22, headerCellStyle1,String.valueOf(std.getHealthTh()));
                ExcelUtils.createCell(row, 23, headerCellStyle1,String.valueOf(std.getHealthPr()));
                ExcelUtils.createCell(row, 24, headerCellStyle1,String.valueOf(std.getHealthTh()+std.getHealthPr()));
                ExcelUtils.createCell(row, 25, headerCellStyle1,String.valueOf(std.getMoralTh()));
                ExcelUtils.createCell(row, 26, headerCellStyle1,String.valueOf(std.getMoralPr()));
                ExcelUtils.createCell(row, 27, headerCellStyle1,String.valueOf(std.getMoralTh()+std.getMoralPr()));
                ExcelUtils.createCell(row, 28, headerCellStyle1,String.valueOf(std.getOptTh()));
                ExcelUtils.createCell(row, 29, headerCellStyle1,String.valueOf(std.getOptPr()));
                ExcelUtils.createCell(row, 30, headerCellStyle1,String.valueOf(std.getOptTh()+std.getOptPr()));
                ExcelUtils.createCell(row, 31, headerCellStyle1,String.valueOf(std.getEnglishTh()+std.getEnglishPr()+
                        std.getNepaliTh()+std.getNepaliPr()+std.getMathTh()+
                        std.getScienceTh()+std.getSciencePr()+std.getObtTh()+std.getObtPr()+std.getHealthTh()+std.getHealthPr()+
                        std.getMoralTh()+std.getMoralPr()+std.getOptTh()+std.getOptPr()));

            }
            Row row5 = sheet.createRow(rowIdx+2);
            Cell cell5 = row5.createCell(2);
            cell5.setCellValue("HeadMaster");
            Cell cell2 = row5.createCell(14);
            cell2.setCellValue("Secretary");
            Cell cell3 = row5.createCell(26);
            cell3.setCellValue("Chief Administrator Officer");
            //ExcelUtils.setMergedCell(sheet,  "Chief Administrator Officer", rowIdx+3, rowIdx+3, 25, 29);

            workbook.write(out);
            return new ByteArrayInputStream(out.toByteArray());
        }
    }
    public static ByteArrayInputStream studentsToExcel() throws IOException {
        String[] COLUMNs = {
                "Th","Pr","Th","Pr","Th",
                "Th","Pr","Th","Pr","Th","pr","Th","Pr","Th",
                "Pr","Th","Pr"};
        try (
                Workbook workbook = new XSSFWorkbook();
                ByteArrayOutputStream out = new ByteArrayOutputStream();
        ) {
            Sheet sheet = workbook.createSheet("Header");
                //Row row = sheet.createRow(0);
            CellStyle headerCellStyle = workbook.createCellStyle();
            PropertyTemplate pt = new PropertyTemplate();
            Row row = sheet.createRow(0);
            Cell cell = row.createCell(0);
            cell.setCellValue("id");
            //Merging cells by providing cell index
            //
            pt.drawBorders(new CellRangeAddress(0,1,0,0),BorderStyle.MEDIUM, BorderExtent.OUTSIDE);
            sheet.addMergedRegion(new CellRangeAddress(0,1,0,0));
            Cell cell2 = row.createCell(1);
            cell2.setCellValue("Student Name");
            sheet.addMergedRegion(new CellRangeAddress(0,1,1,1));
            Cell cell3 = row.createCell(2);
            cell3.setCellValue("Year.");
            sheet.addMergedRegion(new CellRangeAddress(0,1,2,2));
            Cell cell4 = row.createCell(3);
            cell4.setCellValue("School Name");
            sheet.addMergedRegion(new CellRangeAddress(0,1,3,3));
            Cell cell5 = row.createCell(4);
            cell5.setCellValue("ROll/Symbol No.");
            sheet.addMergedRegion(new CellRangeAddress(0,1,4,4));
            Cell cell6 = row.createCell(5);
            cell6.setCellValue("dof");
            sheet.addMergedRegion(new CellRangeAddress(0,1,5,5));
            Cell cell7 = row.createCell(6);
            cell7.setCellValue("Father Name");
            sheet.addMergedRegion(new CellRangeAddress(0,1,6,6));
            Cell cell8 = row.createCell(7);
            cell8.setCellValue("Mother Name");
            sheet.addMergedRegion(new CellRangeAddress(0,1,7,7));
            Cell cell9 = row.createCell(8);
            cell9.setCellValue("English");
            sheet.addMergedRegion(new CellRangeAddress(0,0,8,9));
            cell.setCellStyle(headerCellStyle);
            Cell cell10 = row.createCell(10);
            cell10.setCellValue("Nepali");
            sheet.addMergedRegion(new CellRangeAddress(0,0,10,11));
            Cell cell11 = row.createCell(12);
            cell11.setCellValue("Math");
            //sheet.addMergedRegion(new CellRangeAddress(0,0,8,9));
            Cell cell12 = row.createCell(13);
            cell12.setCellValue("Science");
            sheet.addMergedRegion(new CellRangeAddress(0,0,13,14));
            Cell cell13 = row.createCell(15);
            cell13.setCellValue("Social");
            sheet.addMergedRegion(new CellRangeAddress(0,0,15,16));
            Cell cell14 = row.createCell(17);
            cell14.setCellValue("OBT");
            sheet.addMergedRegion(new CellRangeAddress(0,0,17,18));
            Cell cell15 = row.createCell(19);
            cell15.setCellValue("Health & Pop");
            sheet.addMergedRegion(new CellRangeAddress(0,0,19,20));
            Cell cell16 = row.createCell(21);
            cell16.setCellValue("Moral");
            sheet.addMergedRegion(new CellRangeAddress(0,0,21,22));
            Cell cell20 = row.createCell(23);
            cell20.setCellValue("OPT");
            sheet.addMergedRegion(new CellRangeAddress(0,0,23,24));
            Row headerRow = sheet.createRow(1);
            for (int col = 0; col < COLUMNs.length; col++) {
                ExcelUtils.createCell1(headerRow, col+8, headerCellStyle, COLUMNs[col]);
            }

            //sheet.addMergedRegion(new CellRangeAddress(0,1,2,2));
            /*
            Row row2 = sheet.createRow((short) 1);
            Cell cell2 = row.createCell((short) 1);
            cell.setCellValue("This is a test of merging");

            sheet.addMergedRegion(new CellRangeAddress(
                    1, //first row (0-based)
                    1, //last row  (0-based)
                    3, //first column (0-based)
                    4  //last column  (0-based)
            ));*/
                workbook.write(out);
            return new ByteArrayInputStream(out.toByteArray());
        }
    }
    public static List<Student> parseExcelFile(MultipartFile file) {

        try {
            InputStream in = file.getInputStream(); // yo line  ma matra rakhe pugxa
            Workbook workbook = new XSSFWorkbook(in);
            // aba f8 thicha tala tala janxa jun thau ma error auxa tyo line pugdaina

            Sheet sheet = workbook.getSheetAt(0);  // yo line  ma errro thio. getSheet() getda
            // debug garda mathi ko button le run gara ye
            Iterator<Row> rows = sheet.iterator();

            List<Student> lstStudent = new ArrayList<>();

            int rowNumber = 0;
            while (rows.hasNext()) {
                Row currentRow = rows.next();
                // skip header
                if (rowNumber == 0) {
                    rowNumber++;
                    continue;
                }
                Iterator<Cell> cellsInRow = currentRow.iterator();
                Student std = new Student();

                int cellIndex = 0;
                while (cellsInRow.hasNext()) {
                    Cell currentCell = cellsInRow.next();
                    if(cellIndex==0){
                        cellIndex++;
                        continue;
                    }

                    if (cellIndex == 0) { // ID
                        std.setId((long) currentCell.getNumericCellValue());
                    } else if (cellIndex == 1) { // Name
                        std.setSchoolName(currentCell.getStringCellValue());
                    } else if (cellIndex == 2) { // year
                        std.setYear((long)currentCell.getNumericCellValue());
                    }else if (cellIndex == 3) { // roll no
                        std.setRollNo((int) currentCell.getNumericCellValue());
                    }else if (cellIndex == 4) { // school name
                        std.setName(currentCell.getStringCellValue());
                    }  else if (cellIndex == 5) { // date of birth
                        std.setDoB(currentCell.getStringCellValue());
                    } else if (cellIndex == 6) { // father name
                        std.setFatherName(currentCell.getStringCellValue());
                    } else if (cellIndex == 7) { // mother name
                        std.setMotherName(currentCell.getStringCellValue());
                    } else if (cellIndex == 8) { // English th
                        std.setEnglishTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 9) { // english Pr
                        std.setEnglishPr((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 10) { // nepali th
                        std.setNepaliTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 11) { // nepali th
                        std.setNepaliPr((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 12) { // math th
                        std.setMathTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 13) { // science th
                        std.setScienceTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 14) { // science th
                        std.setSciencePr((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 15) { // social th
                        std.setSocialTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 16) { // social th
                        std.setSocialPr((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 17) { // obt th
                        std.setObtTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 18) { // obt th
                        std.setObtPr((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 19) { // health th
                        std.setHealthTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 20) { // health th
                        std.setHealthPr((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 21) { // moral th
                        std.setMoralTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 22) { // moral th
                        std.setMoralPr((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 23) { // opt th
                        std.setOptTh((float) currentCell.getNumericCellValue());
                    } else if (cellIndex == 24) { // opt th
                        std.setOptPr((float) currentCell.getNumericCellValue());
                    }

                    cellIndex++;
                }

                lstStudent.add(std);
            }

            // Close WorkBook
            workbook.close();

            return lstStudent;
        } catch (IOException e) {
            throw new RuntimeException("FAIL! -> message = " + e.getMessage());
        }
    }
}