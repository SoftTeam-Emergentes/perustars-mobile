
abstract class UserInterface{
  Future<bool> register(String firstName,String lastName,String email,String password);
  Future<bool> logIn(String email,String password);
  Future<void> update(int id,String firstName,String lastName);
}