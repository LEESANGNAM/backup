<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao map</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 500px; "></div>
	<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=533e66e32425102c4a7ce1591de690c6&libraries=services"></script>
	<script>
	    <%String test = request.getParameter("hi");%>
		var test = "<%=test%>";
		//검색 변수
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});//인포윈도우 생성

		var mapContainer = document.getElementById('map');
		var mapOptions = {
			center : new kakao.maps.LatLng(37.5317717, 126.8445168),//지도중심좌표
			level : 3
		//지도확대
		};
		var map = new kakao.maps.Map(mapContainer, mapOptions); //지도생성

		var ps = new kakao.maps.services.Places(); //검색객체 생성

		if (test == "null") {console.log("test");} // 처음 검색이없을경우 문자열 null 이 들어가있음 
		else {ps.keywordSearch(test, placesSearchCB);} //검색이 없을경우를 제외한 나머지를 전부검색

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({map : map,position : new kakao.maps.LatLng(place.y, place.x)});
			//마우스를위에 올렸을때 인포윈도우 안의 내용을 셋팅하고 오픈한다.
			kakao.maps.event.addListener(marker,'mouseover',function() {
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'+ place.place_name	+ '<br>'+ '<a href ='+place.place_url+'>상세정보 보기</div>');//상세정보	
				infowindow.open(map, marker);//창띄우기
							});
			//마우스 뺐을때 가게의 웹사이트 링크를 클릭하기위해 지연시간 1.5초셋팅
			setTimeout(function() {kakao.maps.event.addListener(marker, 'mouseout', function() {infowindow.close();	});	}, 1500);

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				var map_name = place.place_name; //place 가 오브젝트로 값을 가지고 있어서  가게명과 도로명주소를 변수에 직접 대입
				var map_add = place.road_address_name;
				location.href = "search.jsp?map_name=" + map_name + "&map_add="	+ map_add + "&test=" + test;
				// search 페이지로 map_name 과 map_add와 검색어를 파라미터로 넘겨줍니다.		    
			});
			// 마커가 지도 위에 표시되도록 설정합니다

		}
	</script>
</body>
</html>