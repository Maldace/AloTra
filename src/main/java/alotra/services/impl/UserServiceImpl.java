package alotra.services.impl;

import alotra.dao.UserDao;
import alotra.dao.impl.UserDaoImpl;
import alotra.models.UserModel;
import alotra.services.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    @Override
    public UserModel findbyUserName(String username) {
        return userDao.findbyUserName(username);
    }

    @Override
    public UserModel login(String username, String password) {
        UserModel user = this.findbyUserName(username);
        if (user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public boolean register(String email, String password, String username, String fullname, String phone) {
        try {
            UserModel user = new UserModel();
            user.setEmail(email);
            user.setPassword(password);
            user.setUsername(username);
            user.setFullname(fullname);
            user.setPhone(phone);
            user.setRoleid(1); // mặc định role user

            userDao.insert(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }
}