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
    private static final String SELECT_FORM_LOGIN_ROLES = " SELECT a.account_id,a.user,a.pass,u.user_roles_id,r.roles_name FROM `account` AS a\n" +
            "JOIN customer AS c ON c.id=a.account_id\n" +
            "JOIN user_roles AS u ON a.account_id=u.account_id\n" +
            "JOIN roles AS r ON  u.user_roles_id= r.roles_id\n" +
            "WHERE a.user='heeyeon' AND a.pass='123456' AND u.user_roles_id=1;";
    private static final String INSERT_INTO_LOGIN = "CALL create_account_customer(?,?,?);";
    private static final String INSERT_INTO_ROLES = "INSERT INTO roles(roles_name) VALUES (?);";

    private static final String LOGIN = "  SELECT * FROM `account`  WHERE user =? AND pass=?; ";
    private static final String CHECK_LOGIN = "SELECT * FROM `account`  WHERE user =?;";

    private static final String EDIT_LOGIN = "UPDATE account SET user=?,pass=? WHERE id=?;";
    @Override
    public List<Account> getCheckRolesAccount() {
        List<Account> loginList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORM_LOGIN_ROLES);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String user = resultSet.getString("user");
                String pass = resultSet.getString("pass");
                int roleId=resultSet.getInt("user_roles_id");
                Role role=new Role(roleId);
                Account login=new Account(user,pass,role);
                loginList.add(login);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loginList;
    }

    @Override
    public boolean saveLogin(Account login) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_LOGIN);
            preparedStatement.setString(1, login.getUser());
            preparedStatement.setString(2, login.getPass());
//            preparedStatement.setString(3,role.getRoleName());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account checkLogin(String user, String pass) {
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
    public Role checkRole(String roleName) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_ROLES);
            preparedStatement.setString(1, roleName);
            ResultSet resultSet = preparedStatement.executeQuery();

//            trả về nhiều nhất 1 bản ghi
            if (resultSet.next()) {
                return new Role(resultSet.getString(2));
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

    @Override
    public boolean editLogin(Account login) {
        Connection connection=BaseRepository.getConnection();
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
