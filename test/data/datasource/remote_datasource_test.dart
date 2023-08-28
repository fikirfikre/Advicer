import 'package:advicer/data/Exception/exception.dart';
import 'package:advicer/data/datasource/advice_remote_datasource.dart';
import 'package:advicer/data/models/advicer_model.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdvicerRemoteDatasource', () {
    group('should return AdviceModel', () {
      test('when a Client response wass 200 and has valid data ', () async {
        final mockClinet = MockClient();
        final adviceRemoteDatasourceTest =
            AdvicerRemoteDatasourceImpl(client: mockClinet);
        const responsBody = '{"advice_id": 1,"advice": "Embrace"}';

        when(mockClinet.get(
                Uri.parse("https://api.flutter-community.com/api/v1/advice"),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((realInvocation) {
          return Future.value(Response(responsBody, 200));
        });
        final result = await adviceRemoteDatasourceTest.getAdviceFromApi();
        expect(result, AdvicerModel(advice_id: 1, advice: "Embrace"));
      });
    });

    group('throw exception', () {
      test('Server Exception thrown because the response is not 200', () {
        final mockClient = MockClient();
        final advicerRemoteDatasourceTest = AdvicerRemoteDatasourceImpl(client: mockClient);
        when(mockClient.get(
                Uri.parse("https://api.flutter-community.com/api/v1/advice"),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((realInvocation) {
          return Future.value(Response('', 201));
        });
        // final result = await advicerRemoteDatasourceTest.getAdviceFromApi();
        expect(()=>advicerRemoteDatasourceTest.getAdviceFromApi(), throwsA(isA<ServerException>()));
      });

      test('Server Exception thrown even if the response is 200 and we got non valid data', () {
        final mockClient = MockClient();
        final advicerRemoteDatasourceTest = AdvicerRemoteDatasourceImpl(client: mockClient);
        const responseBody = '{"advice":"test advice"}';
        when(mockClient.get(
                Uri.parse("https://api.flutter-community.com/api/v1/advice"),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((realInvocation) {
          return Future.value(Response(responseBody, 200));
        });
        // final result = await advicerRemoteDatasourceTest.getAdviceFromApi();
        expect(()=>advicerRemoteDatasourceTest.getAdviceFromApi(), throwsA(isA<TypeError>()));
      });
      
    });
  });
}
