<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 태그</title>
</head>
<body>
	 <h2>음식 카테고리</h2>
   
   <form action=""method="Post" id="foodTotal">
    <form id="foodCategory">
        <label><input type="checkbox" name="foodCategory" value="한식"> 한식</label><br>
        <label><input type="checkbox" name="foodCategory" value="중식"> 중식</label><br>
        <label><input type="checkbox" name="foodCategory" value="일식"> 일식</label><br>
        <label><input type="checkbox" name="foodCategory" value="아시안"> 아시안</label><br>
        <label><input type="checkbox" name="foodCategory" value="멕시칸"> 멕시칸</label><br>
        <label><input type="checkbox" name="foodCategory" value="족발"> 족발.보쌈</label><br>
        <label><input type="checkbox" name="foodCategory" value="찌개"> 찜.탕.찌개</label><br>
        <label><input type="checkbox" name="foodCategory" value="피자"> 피자</label><br>
        <label><input type="checkbox" name="foodCategory" value="치킨"> 치킨</label><br>
        <label><input type="checkbox" name="foodCategory" value="햄버거"> 햄버거</label><br>
        <label><input type="checkbox" name="foodCategory" value="야식"> 야식</label><br>
        <label><input type="checkbox" name="foodCategory" value="고기"> 고기</label><br>
        <label><input type="checkbox" name="foodCategory" value="분식"> 분식</label><br>
        <label><input type="checkbox" name="foodCategory" value="디저트"> 디저트</label><br>
        <label><input type="checkbox" name="foodCategory" value="상관없음"> 상관없음</label><br>
    </form>

    <h2>취향</h2>
    <form id="preference">
        <label><input type="checkbox" name="preference" value="매운맛"> 매운맛</label><br>
        <label><input type="checkbox" name="preference" value="신맛"> 신맛</label><br>
        <label><input type="checkbox" name="preference" value="짠맛"> 짠맛</label><br>
        <label><input type="checkbox" name="preference" value="단맛"> 단맛</label><br>
        <label><input type="checkbox" name="preference" value="맵찔이"> 맵찔이</label><br>
        <label><input type="checkbox" name="preference" value="상관없음"> 상관없음</label><br>
    </form>
    <br>
    <input type="submit">
    </form>
    
</body>

   

</html>