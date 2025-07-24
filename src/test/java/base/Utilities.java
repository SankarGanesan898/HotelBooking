package base;

import java.util.Random;
import org.json.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Utilities {
	

	ObjectMapper mapper;
	protected BookingRequest bookingRequest = new BookingRequest();;
	String CONTENT_TYPE;
	protected Response response;
	RequestSpecification requestSpecification;
	JSONObject requestBody;
	
	public Utilities() {
		mapper = new ObjectMapper();
	}
	
	public String createRequestBody() throws JsonProcessingException {
		String requestbody = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(bookingRequest);
		return requestbody;
	}
	
	public RequestSpecification requestSetup() {

		RestAssured.baseURI = LoadProperties.getProperty("appURL");
		CONTENT_TYPE = LoadProperties.getProperty("content.type");
		return RestAssured.given().contentType(CONTENT_TYPE).accept(CONTENT_TYPE);
	}	

	public String generateRandomRoomId() {

		final Random random = new Random();
		return String.valueOf(2000 + random.nextInt(900));

	}

}
