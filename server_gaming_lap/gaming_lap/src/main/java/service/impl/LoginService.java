package service.impl;

import model.Customer;
import model.Login;
import repository.ILoginRepository;
import repository.impl.LoginRepository;
import service.ILoginService;

import java.util.List;

public class LoginService implements ILoginService {
    private static    ILoginRepository iLoginRepository=new LoginRepository();
    @Override
    public List<Login> getAll() {
        List<Login> loginList=iLoginRepository.getAll();
        if (loginList.size()==0){
            System.out.println("NO");
            return null;
        }
        return loginList;
    }

    @Override
    public boolean saveLogin(Login login) {
        return iLoginRepository.saveLogin(login);
    }

    @Override
    public Login checkLogin(String user, String pass) {
        return iLoginRepository.checkLogin(user, pass);
    }

    @Override
    public Login checkLoginExit(String user) {
        return iLoginRepository.checkLoginExit(user);
    }

    @Override
    public boolean editLogin(Login login) {
        return false;
    }
}
