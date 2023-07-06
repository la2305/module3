package com.example.demo.respository;

import com.example.demo.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.example.demo.respository.BaseRespository.getConnection;

public class UserRespository implements IUserRespository {

    //    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
//    private String jdbcUsername = "root";
//    private String jdbcPassword = "codegym";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String INSERT_USERS_SQL = "insert into users (name,email,country) values(?,?,?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?;";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static  final String UPDATE_USERS_SQL ="UPDATE users SET name = ?, email = ?, country =? WHERE id=?;";
    private static final String SORT_BY_NAME = "SELECT * FROM users ORDER BY name ASC;";
    private static final String SELECT_BY_COUNTRY = "SELECT * FROM users WHERE country LIKE ?;";


    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    ////// gởi lên  database bằng cách nào?
    @Override
    public void insertUser(User user) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = getConnection();
        try {
//            ????????????
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = getConnection();
        try {
//            ???????????????
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        Connection connection = getConnection();
        try  {
//            ?????????????
            PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            rowUpdate = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }

    @Override
    public List<User> sortByName() {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRespository.getConnection();
        try {
//            ??????????
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME);
//            ?????????
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<User> searchByCountry(String searchStr) {
        List<User> list = new ArrayList<>();
        String strSQL = "%" + searchStr + "%";

        Connection connection = BaseRespository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_COUNTRY);
            preparedStatement.setString(1, strSQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


}
