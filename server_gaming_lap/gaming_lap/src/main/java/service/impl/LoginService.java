package service.impl;

import model.Account;
import repository.ILoginRepository;
import repository.impl.LoginRepository;
import service.ILoginService;

import java.util.List;

public class LoginService implements ILoginService {
    private static    ILoginRepository iLoginRepository=new LoginRepository();
    @Override
    public List<Account> getAll() {
        List<Account> loginList=iLoginRepository.getAll();
        if (loginList.size()==0){
            System.out.println("NO");
            return null;
        }
        return loginList;
    }

    @Override
    public boolean saveLogin(Account login) {
        return iLoginRepository.saveLogin(login);
    }

    @Override
    public Account checkLogin(String user, String pass) {
        return iLoginRepository.checkLogin(user, pass);
    }

    @Override
    public Account checkLoginExit(String user) {
        return iLoginRepository.checkLoginExit(user);
    }

    @Override
    public boolean editLogin(Account login) {
        return false;
    }
}
