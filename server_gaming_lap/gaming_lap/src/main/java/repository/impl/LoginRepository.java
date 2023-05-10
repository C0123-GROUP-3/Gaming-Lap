package repository.impl;

import model.Account;
import repository.ILoginRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginRepository implements ILoginRepository {
    private static final String SELECT_FORM_LOGIN = "SELECT * FROM `account`;";
    private static final String INSERT_INTO_LOGIN = "INSERT INTO `account` (user,pass) VALUES(?,?);";

    private static final String LOGIN = " SELECT * FROM `account`  WHERE user =? AND pass=? ";
    private static final String CHECK_LOGIN = "SELECT * FROM `account`  WHERE user =?";
    private static final String EDIT_LOGIN = "UPDATE account SET user=?,pass=? WHERE id=?;";
    @Override
    public List<Account> getAll() {
        List<Account> loginList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORM_LOGIN);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String user = resultSet.getString("user");
                String pass = resultSet.getString("pass");
                Account login=new Account(id,user,pass);
                loginList.add(login);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loginList;
    }

    @Override
    public boolean saveLogin(Account login) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_LOGIN);
            preparedStatement.setString(1, login.getUser());
            preparedStatement.setString(2, login.getPass());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account checkLogin(String user, String pass) {
        Connection connection = BaseRepository.getConnectDB();
//        List<Login> loginList = getAll();
//        for (Login l:loginList) {
//            if (user.equals(l.getUser())&& pass.equals(l.getPass())){
//                System.out.println(l);
//            }
//        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LOGIN);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            ResultSet resultSet = preparedStatement.executeQuery();
//            trả về nhiều nhất 1 bản ghi
            if (resultSet.next()) {
                return new Account(resultSet.getString(2),resultSet.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Account checkLoginExit(String user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_LOGIN);
            preparedStatement.setString(1, user);
            ResultSet resultSet = preparedStatement.executeQuery();
//            trả về nhiều nhất 1 bản ghi
            if (resultSet.next()) {
                return new Account(resultSet.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean editLogin(Account login) {
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(EDIT_LOGIN);
            preparedStatement.setString(1, login.getUser());
            preparedStatement.setString(2, login.getPass());
            preparedStatement.setInt(3,login.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
