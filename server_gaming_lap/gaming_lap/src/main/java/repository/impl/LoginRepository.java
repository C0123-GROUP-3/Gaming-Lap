package repository.impl;

import model.Account;
import model.Role;
import repository.BaseRepository;
import repository.ILoginRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginRepository implements ILoginRepository {

    private static final String INSERT_INTO_LOGIN = "INSERT INTO `account`(`user`,pass,role_id) VALUES(?,?,2);";

    private static final String LOGIN = "   SELECT * FROM `account`  WHERE  user=? AND pass=? AND role_id =?; ";
    private static final String CHECK_LOGIN = "SELECT * FROM `account`  WHERE user =?;";
    private static final String GETALL = "SELECT * FROM `account` ;";



    @Override
    public boolean saveLogin(Account login) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_LOGIN);
            preparedStatement.setString(1, login.getUser());
            preparedStatement.setString(2, login.getPass());
//            preparedStatement.setInt(3,login.getRoleId());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public List<Account> getCheckRolesAccount() {
        List<Account> loginList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GETALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String user = resultSet.getString("user");
                String pass = resultSet.getString("pass");
                int roleId = resultSet.getInt("role_id");
//                Role role = new Role(roleId);
                Account login = new Account(user, pass,roleId);
                loginList.add(login);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loginList;
    }
    public Account checkLogin(String user, String pass, int role) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement= connection.prepareStatement(LOGIN);

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
        Connection connection = BaseRepository.getConnection();
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

}
