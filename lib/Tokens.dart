
class Tokens {
  String  tokenName;
  List<Account> accounts;

  Tokens(this.tokenName, this.accounts);

  @override
  String toString() {
    return 'Tokens{tokenName: $tokenName, accounts: $accounts}';
  }


}

class Account{
  String address;
  String name;

  Account(this.address, this.name);

  @override
  String toString() {
    return 'Account{address: $address, name: $name}';
  }

}
