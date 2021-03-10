<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao map</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 700px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=533e66e32425102c4a7ce1591de690c6&libraries=services"></script>
	<script>
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});//인포윈도우 생성
	 <%String test = request.getParameter("hi");%>
	 var test = "<%=test%>"+ "카페" ;
		//검색 변수 // 지역을 입력받아검색하기 때문에 카페문자열을 추가로 삽입
		var mapContainer = document.getElementById('map');
		var mapOptions = {
			center : new kakao.maps.LatLng(37.5317717, 126.8445168),//지도중심좌표
			level : 3
		//지도확대
		};
		var map = new kakao.maps.Map(mapContainer, mapOptions); //지도생성

		var ps = new kakao.maps.services.Places(); //검색객체 생성

		var latlng = map.getCenter();
		ps.keywordSearch(test, placesSearchCB);//CE7 카페  fd6 음식점 키워드검색으로 먼저 검색한 지역의 카페를검색 
		// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'dragend', function() {
			var latlng = map.getCenter(); // map 객체의 드래그가 끝나면함수를 실행. latlng에 map 객체의 센터 좌표를 저장
			ps.categorySearch('CE7', placesSearchCB, {
				location : latlng
			})//CE7 카페 키워드 검색 실행 주소값은 현재 드래그가 끝난 지도의 중심좌표
		});

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
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});
			//마우스를위에 올렸을때
			kakao.maps.event
					.addListener(
							marker,
							'mouseover',
							function() {
								infowindow
										.setContent('<div style="padding:5px;font-size:12px;">'
												+ place.place_name
												+ '<br>'
												+ '<a href ='+place.place_url+'>상세정보 보기</div>');//상세정보

								infowindow.open(map, marker);//창띄우기
							});
			//마우스 뺐을때 가게의 웹사이트 링크를 클릭하기위해 지연시간 1.5초셋팅
			setTimeout(function() {
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
			}, 1500);

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {

				var map_name = place.place_name;
				var map_add = place.road_address_name;
				location.href = "search.jsp?map_name=" + map_name + "&map_add="
						+ map_add + "&test=" + map_add;

			});
			// 마커가 지도 위에 표시되도록 설정합니다

		}
	</script>
</body>
</html>